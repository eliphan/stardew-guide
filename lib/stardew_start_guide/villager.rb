
class StardewStartGuide::Villager
  attr_accessor :name, :link
  @@all = []

  def self.all
    @@all
  end

  def initialize
    @name = name
    @link = link
    @@all << self
  end

  def self.find_by_name(name)
    @@all.detect {|v| v.name == name}
  end

  def self.list_villagers
    @@all.each.with_index(1) do |v,i|
    puts "#{i}. #{v.name}"
   end
  end

end
