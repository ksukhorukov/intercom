require 'spec_helper'
require_relative '../lib/customers'

describe "Welcomed Customers" do 

  it "should correctly transform angels to radians" do 
    expect(convert_to_radians(90)).to eq(1.57)
  end

  it "should correctly calculate distance between customer and office" do 
    dst = distance(0.924317875, -0.10542900633333334, 0.9304552405000001, -0.10918927146666667)
    expect(dst.round).to eq(42)
  end

  it "far_away function should return true when a client is out of sight" do
     expect(far_away(0.9216510904444445, -0.14866794022222224, 0.9304552405000001, -0.10918927146666667, 100)).to eq(true)
   end

  it "far_away function should return false when a client within the sight" do
      expect(far_away(0.9435609236555556, -0.10792371888888888, 0.9304552405000001, -0.10918927146666667, 100)).to eq(false)
   end

end