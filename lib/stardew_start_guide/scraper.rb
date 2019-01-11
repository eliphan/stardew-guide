require 'open-uri'

class StardewStartGuide::Scraper

   def get_villagers_page
     Nokogiri::HTML(open("https://stardewvalleywiki.com/Villagers"))
   end

   def get_villagers
     get_villagers_page.css(".gallerytext a")
   end

   def make_villagers
     self.get_villagers.each do |person|
       villager = StardewStartGuide::Villager.new
       villager.name = person.attr("title")
       villager.link = "https://stardewvalleywiki.com#{person.attr("href")}"
       villager

     end
    end

end
