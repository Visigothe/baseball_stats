require 'open-uri'

class HitterParser

  def initialize
    url = 'http://www.cafeconleche.org/examples/baseball/1998statistics.xml'
    @parser = Nokogiri::HTML(open(url))
  end

  def hitters
    hitter_record = {}
    yield hitter_record
  end

end