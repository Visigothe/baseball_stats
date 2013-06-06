require 'spec_helper'

describe HitterParser do

  it '#new creates a new instance of HitterParser' do
    expect(HitterParser.new.class).to eq HitterParser
  end

  it '#initialize sets @parser' do
    HitterParser.new
    url = 'http://www.cafeconleche.org/examples/baseball/1998statistics.xml'
    expect(Nokogiri::HTML(open(url))).to eq @parser
  end

  it '#hitters parses xml from the page opened by @parser'

end