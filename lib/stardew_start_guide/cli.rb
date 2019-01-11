class StardewStartGuide::CLI

  def call
    puts "Welcome to Stardew Start Guide, your guide for villagers in Stardew Valley!"
    menu
  end

  def menu
    input = nil
    while input != "exit"
    puts "To list all villagers, enter 'list'."
    puts "To find a villager, enter 'find'."
    puts "To quit, enter 'exit'."
    puts "What would you want to do?"
    input = gets.strip.downcase
    case input
    when "list"
      list_villagers
    when "find"
      find_villager
    when "exit"
      puts "Thanks for using this guide!"
      break
    else
      puts "Please choose again."
    end
   end
  end

  def list_villagers
    puts "Here's the list of villagers in the game:"
    @villagers = StardewStartGuide::Villager.all
    @villagers.each.with_index(1) do |v,i|
     puts "#{i}. #{v.name}"
   end
  end

  def find_villager
    input = nil
    puts "Please enter the villager's name (case sensitive):"
    input = gets.strip
    if @villager = StardewStartGuide::Villager.find_by_name(input)
      puts "Here's the link for #{@villager.name}: #{@villager.link}"
    else
      puts "Can't find that villager. Please choose again."
    end
  end

end
