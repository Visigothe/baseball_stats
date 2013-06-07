class Hitter < ActiveRecord::Base

  def self.parse_xml(url)
    self.destroy_all
    HitterParser.new(url).hitters
  end
end
