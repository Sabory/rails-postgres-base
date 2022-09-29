# frozen_string_literal: true

module Core
  class Area
    attr_reader :area, :unit

    def initialize(area, unit)
      @area = area
      @unit = unit
    end
  end
end
