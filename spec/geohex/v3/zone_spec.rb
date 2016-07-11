# -*- coding: utf-8 -*-

require 'spec_helper'
require 'csv'

RSpec.describe Geohex::V3::Zone do

  it { is_expected.to be_respond_to :latitude }
  it { is_expected.to be_respond_to :longitude }
  it { is_expected.to be_respond_to :lat }
  it { is_expected.to be_respond_to :lon }
  it { is_expected.to be_respond_to :level }
  it { is_expected.to be_respond_to :code }
  it { is_expected.to be_respond_to :x }
  it { is_expected.to be_respond_to :y }

  describe :encode do

    CSV.read(File.expand_path("../../../spec/fixtures/files/location2code.csv", File.dirname(__FILE__))).each do |data|

      context "latitude: #{ data[0] } longitude: #{ data[1] } level: #{ data[2] }" do
        let(:latitude)  { data[0].to_f }
        let(:longitude) { data[1].to_f }
        let(:level)     { data[2].to_i }
        let(:code)      { data[3] }

        subject { Geohex::V3::Zone.encode latitude, longitude, level }

        it { is_expected.to be_eql code }
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

        it { expect(subject.latitude).to be_near_eql latitude, precision }
        it { expect(subject.longitude).to be_near_eql longitude, precision }
        it { expect(subject.level).to be_eql level }
      end
    end
  end
end
