class DemiseController < ApplicationController
  respond_to :html, :json
  def index
    bases = Base.all
    @base_data = []
#    @death_counts = Base.scoped.joins(:deaths).include(:base).group('bases.id').count
    bases.each do |b|
      @base_data[b.id] = { base: b,
        death_toll:  b.deaths.count
      }
    end
    respond_with(@base_data)
  end
end
