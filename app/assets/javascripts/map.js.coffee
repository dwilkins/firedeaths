# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

  heat_spots = [
    {lat: 500, lon: 2500, radius: 100, intensity: .2}
    {lat: 19, lon: 54, radius: 100, intensity: 10}
    {lat: 90, lon: 54, radius: 100, intensity: .90}
    {lat: 500, lon: 54, radius: 100, intensity: .90}
  ]
  heat = ""
  heat_marker = ""
  naturalZoom = 4
  map = ""
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
  ###
  L.CRS.Cartesian = L.extend {}, L.CRS
    Cartesian: (e, c) ->
      L.Util.setOptions(this, c)
      this.unbounded = !0
      this._bounds = e
      a = e.max.x - e.min.x
      r = e.max.y - e.min.y
      n = this.options.falseEasting || 0
      i = 0 + n / (1 * a)
      s = this.options.falseNorthing || 0
      l = 1 - s / (1 * r)
      this.transformation = L.Transformation 1 / a, i, -1 / r, l
      this.projection = L.Projection.Identity
  ###


  testData =
    max: 20,
    data: [
      {lat: 300, lon:50, value: 10},
      {lat: 339, lon:70, value: 1},
      {lat: 38, lon:79, value: 500},
      {lat: 1100, lon:-1400, value: 50},
      {lat: 2000, lon: 1600, value: 40},
      {lat: 2000, lon: 1600, value: 40},
      {lat: 1000, lon:3000, value: 50},
      {lat: 510, lon:400, value: 4}
    ]
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
#      maxBounds: new L.LatLngBounds new L.LatLng(0,0), new L.LatLng(3384,2304)

    layer_options =
      zoom: 4
      minZoom: 0
      maxZoom: 4
      noWrap: true
      continuousWorld: false
      zoomReverse: false

    map = L.map "map", map_options

    tile_layer = new L.TileLayer '/assets/tiles/{z}/map_{x}_{y}.png',layer_options
    tile_layer.addTo(map);

    map.setView [2048,1280],1
    L.control.layers({"Tile Layer": tile_layer}).addTo(map)

    heat = L.TileLayer.heatMap
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
    heat.setData [
      {lat: 1010, lon: 20, value: 500}
      {lat: 14, lon: 2000, value: 100}
      {lat: 160, lon: 2000, value: 200}
      {lat: 1070, lon: 2000, value: 300}
    ]
    ###
    heat.addTo map
    popup = L.popup();

    onMapClick = (e) =>
      heat.redraw()
      popup
      .setLatLng(e.latlng)
      .setContent("You clicked the map at " + e.latlng.toString())
      .openOn(map)

# Debugging map points...
#    map.on 'click', onMapClick


  jQuery ->
    map_init()
    fetch_map_data();


  fetch_map_data = ->
    heat_marker = new L.Icon
      iconUrl: "/assets/heat-marker.png"
      iconAnchor: [15,15]
    (jQuery.get) '/demise/index.json', (data) =>
      heat_data = []
      for bi in data when bi && bi.death_toll > 0
        heat_data.push
          lat: bi.base.game_lat
          lon: bi.base.game_lon
          value: bi.death_toll
        m = new L.Marker([bi.base.game_lat, bi.base.game_lon],{icon: heat_marker, opacity: .5,zIndex: 50, title: bi.base.name + "\nDeaths: " + bi.death_toll})
        m.addTo(map)
      heat.setData heat_data
      heat.redraw();
