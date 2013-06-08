class Hitter < ActiveRecord::Base

  def self.parse_xml(source)
    self.destroy_all
    HitterParser.new(source).hitters
  end
end
