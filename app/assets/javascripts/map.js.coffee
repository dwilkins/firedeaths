# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

  window.heat = ""
  window.heat_marker = ""
  window.map = ""
  window.weapons = []
  window.reasons = []
  window.base_info = []
  window.heat_spots = []
  window.heat_data = []
  window.weapons_cb = []
  window.marker_titles = []
  window.marker_popup = ""
  L.Projection.Identity =
    project: (latlng) =>
      return new L.Point latlng.lat, latlng.lng
    unproject: (point) =>
      if(isNaN(point.y))
        point.y = 0
      if(isNaN(point.x))
        point.x = 0
      return new L.LatLng point.x, point.y
  `
   L.CRS.Cartesian = L.Class.extend({
        includes: L.CRS,
        initialize: function (e, c) {
            L.Util.setOptions(this, c), this.unbounded = !0, this._bounds = e;
            var xsize = e.max.x - e.min.x,
                ysize = e.max.y - e.min.y,
                n = this.options.falseEasting || 0,
                i = 0 + n / (xsize),
                s = this.options.falseNorthing || 0,
                l = 1 - s / (ysize);
                l = 1 - (s / (ysize));
                this.projection = L.Projection.Identity;
                this.transformation = new L.Transformation(1 / xsize, i, -1 / ysize, l)
                this.transformation = new L.Transformation(1 / xsize, 0, -.625 / (ysize), .625)
        }
    })
    `
  class DeathMarker extends L.Marker
    setTitle: (title) =>
      L.Util.setOptions(this, {title: title})
      for a in this._icon.attributes when a
        if a.name == "title"
          a.value = a.nodeValue = a.textContent = title
    getTitle: =>
      for a in this._icon.attributes when a
        if a.name == "title"
          return a.value

  map_init = ->
    sc =
      upperLeft:
        x: 4096
        y: 0
      lowerRight:
        x: 0
        y: 2560
      offset:
        x: 0
        y: 0
      center:
        x: 25
        y: 15

    coords = new L.Bounds(new L.Point(sc.upperLeft.x, sc.upperLeft.y, !1), new L.Point(sc.lowerRight.x, sc.lowerRight.y, !1))
    cart_crs =  new L.CRS.Cartesian(coords, { falseEasting: sc.offset.x, falseNorthing: sc.offset.y})

    map_options =
      zoom: 4
      minZoom: 0
      maxZoom: 4
      dragging: true
      center: [4096/2,2560/2]
      crs: cart_crs

    layer_options =
      zoom: 4
      minZoom: 0
      maxZoom: 4
      noWrap: true
      continuousWorld: false
      zoomReverse: false

    window.map = L.map "map", map_options

    tile_layer = new L.TileLayer '/assets/tiles/{z}/map_{x}_{y}.png',layer_options
    tile_layer.addTo(window.map)

    window.map.setView [2048,1280],1
    L.control.layers({"Tile Layer": tile_layer}).addTo(window.map)

    window.heat = L.TileLayer.heatMap
      radius: 30
      zIndex: 100
      opacity: .8
      crs: cart_crs
      gradient:
        0.45: "rgb(0,0,255)",
        0.55: "rgb(0,255,255)",
        0.65: "rgb(0,255,0)",
        0.95: "yellow",
        1.0: "rgb(255,0,0)"

    ###
    window.heat.setData [
      {lat: 1010, lon: 20, value: 500}
      {lat: 14, lon: 2000, value: 100}
      {lat: 160, lon: 2000, value: 200}
      {lat: 1070, lon: 2000, value: 300}
    ]
    ###
    window.heat.addTo window.map
    popup = L.popup()

    onMapClick = (e) =>
      window.heat.redraw()
      popup
      .setLatLng(e.latlng)
      .setContent("You clicked the map at " + e.latlng.toString())
      .openOn(window.map)


    window.marker_popup = new L.Popup()

# Debugging map points...
#    map.on 'click', onMapClick


  jQuery ->
    map_init()
    fetch_map_data()

  build_weapons = =>
    ($ ".weapons-cb").click =>
      build_heatmap()
    ($ "#weapons-all").click =>
      ($ ".weapons-cb").prop "checked", ($ "#weapons-all").prop "checked"
      build_heatmap()

  build_reasons = =>
    ($ ".reasons-cb").click =>
      build_heatmap()
    ($ "#reasons-all").click =>
      ($ ".reasons-cb").prop "checked", ($ "#reasons-all").prop "checked"
      build_heatmap()

  build_heatmap = =>
    window.heat_data = []
    for w in window.weapons when w
      if $("#w_#{w.id}").prop 'checked'
        w.is_checked = true
      else
        w.is_checked = false
    for r in window.reasons when r
      if $("#r_#{r.id}").prop 'checked'
        r.is_checked = true
      else
        r.is_checked = false
    for bi in window.base_info when bi
      base_total = 0
      heat_data_point = []
      heat_data_point['base'] = bi.base
      heat_data_point['weapons'] = []
      heat_data_point['reasons'] = []
      for dt in bi.death_toll when dt
        ###
        if dt.w? && $("#w_#{dt.w}:checked").length > 0
          heat_data_point['weapons'][dt.w] ?= 0
          heat_data_point['weapons'][dt.w] += dt.v
        if dt.r? && $("#r_#{dt.r}:checked").length > 0
          heat_data_point['reasons'][dt.r] ?= 0
          heat_data_point['reasons'][dt.r] += dt.v
        ###
        if window.reasons[dt.r]? && window.weapons[dt.w]? && window.reasons[dt.r].is_checked? &&
           window.reasons[dt.r].is_checked == true && window.weapons[dt.w].is_checked? &&
           window.weapons[dt.w].is_checked == true
          base_total += dt.v
      window.heat_data.push
        lat: bi.base.game_lat
        lon: bi.base.game_lon
        value: base_total
        detail_data: heat_data_point
      if !bi.old_base_total || bi.old_base_total != base_total
        if !window.heat_spots[bi.base.id]
          window.heat_spots[bi.base.id] = new DeathMarker([bi.base.game_lat, bi.base.game_lon],{
            icon: heat_marker
            opacity: .5
            zIndex: 50
            clickable: true
            title: "#{bi.base.name}\nDeaths: #{base_total}"
          }).addTo(window.map)
          window.heat_spots[bi.base.id].on 'click', (e)  =>
            window.map.openPopup window.marker_popup.setLatLng(e.target.getLatLng()).setContent(e.target.getTitle().replace("\n","<br/>"))
        else
          window.heat_spots[bi.base.id].setTitle bi.base.name + "\nDeaths: " + base_total
        bi.old_base_total = base_total
    window.heat.setData window.heat_data
    window.heat.redraw()

  fetch_map_data = =>
    window.heat_marker = new L.Icon
      iconUrl: "/assets/heat-marker.png"
      iconAnchor: [15,15]
    (jQuery.get) '/demise/index.json', (data) =>
      window.heat_data = []
      for w in data.weapons when w
        window.weapons[w.id] = w
      for r in data.reasons when r
        window.reasons[r.id] = r
      window.base_info = data.base_detail
      build_weapons()
      build_reasons()
      build_heatmap()



