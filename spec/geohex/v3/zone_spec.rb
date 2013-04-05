# -*- coding: utf-8 -*-

require 'spec_helper'
require 'csv'

describe Geohex::V3::Zone do

  it { should be_respond_to :latitude }
  it { should be_respond_to :longitude }
  it { should be_respond_to :lat }
  it { should be_respond_to :lon }
  it { should be_respond_to :level }
  it { should be_respond_to :code }
  it { should be_respond_to :x }
  it { should be_respond_to :y }

  describe :encode do

    CSV.read(File.expand_path("../../../spec/fixtures/files/location2code.csv", File.dirname(__FILE__))).each do |data|

      context "latitude: #{ data[0] } longitude: #{ data[1] } level: #{ data[2] }" do
        let(:latitude)  { data[0].to_f }
        let(:longitude) { data[1].to_f }
        let(:level)     { data[2].to_i }
        let(:code)      { data[3] }

        subject { Geohex::V3::Zone.encode latitude, longitude, level }

        it { should be_eql code }
      end
    end
  end

  describe :decode do

    let(:precision) { 10 }

    CSV.read(File.expand_path("../../../spec/fixtures/files/code2location.csv", File.dirname(__FILE__))).each do |data|

      context "code: #{ data[3] }" do
        let(:latitude)  { data[0].to_f }
        let(:longitude) { data[1].to_f }
        let(:level)     { data[2].to_i }
        let(:code)      { data[3] }

        subject { Geohex::V3::Zone.decode code }

        its(:latitude)  { should be_near_eql latitude, precision }
        its(:longitude) { should be_near_eql longitude, precision }
        its(:level)     { should be_eql level }
      end
    end
  end
end
