require "geohex/version"
require "geohex/v3"

module Geohex
  def encode(latitude, longitude, level)
    Geohex::V3::Zone.encode(latitude, longitude, level)
  end
  
  def decode(code)
    Geohex::V3::Zone.decode(code)
  end
  
  def getZoneByXY(x, y, level)
    Geohex::V3::Zone.getZoneByXY(x, y, level)
  end
end
