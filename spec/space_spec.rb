require 'spec_helper'
require_relative '../app/models/space'

describe Space do
  let(:params) do
    {name: "London Penthouse",
    description: "Lovely big city flat in Whitechapel E1",
    price: 100,
    capacity: 4,
    start_date: '2015-01-01',
    end_date: '2016-01-01'}
  end
  let(:request1) {Request.new( {date: Date.parse('2015-01-31')} ) }
  let(:request2) {Request.new( {date: Date.parse('2015-01-30') } ) }
  let(:request3) {Request.new( {date: Date.parse('2015-01-29') } ) }
  subject(:space){ described_class.new params}

  before(:each) do
    [request1, request2, request3].each do |request|
      request.accepted = true if request != request3
      space.requests << request
    end
  end

  it "should be available on the 1st jan 2015" do
    expect(space.is_available? Date.parse('2015-01-01')).to be true
  end

  it "should be unavailable on the 31st Dec 2014" do
    expect(space.is_available? Date.parse('2014-12-31')).to be false
  end

  it "should be unavailable on the 2nd Jan 2016" do
    expect(space.is_available? Date.parse('2016-01-02')).to be false
  end

  it "should be unavailable on the 30th Jan 2015" do
    expect(space.is_available? Date.parse('2015-01-30')).to be false
  end

  it "should be unavailable on the 31th Jan 2015" do
    expect(space.is_available? Date.parse('2015-01-31')).to be false
  end

  it "should be available on the 29th Jan 2015" do
    expect(space.is_available? Date.parse('2015-01-29')).to be true
  end
end
