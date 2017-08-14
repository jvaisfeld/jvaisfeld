# create xmas wishlist
# be able to do 4 thing
# 1. display wishlist
# 2. add gift to list
# 3. mark a gift (as bought)
# 4. delete a gift

# create empty array for gifts
# ask user for what he wants to do
# store users input
# different actions

# 1. display wishlist

# 2. add gift to the list
# ask user for gift
# store it into list

# 3. mark a gift
# [x] parfume
# 4. delete items
require_relative "scraping_etsy"

christmas_list = [{gift_name: "football", status: "bought"}, {gift_name: "socks", status: "not_bought"}]

# p christmas_list[0][:status]
def display_list (list)
  list.each_with_index do |gift, index|
    puts "#{index + 1} - #{gift[:gift_name]}"
  end
end

puts "welcome to the xmas list"
action = nil

until action == "exit"
  puts "Choose one of the following options: Display|Add|Ideas|Check|Delete|status|Exit"
  action = gets.chomp.downcase

  case action
  when "display"
    display_list(christmas_list)
  when "add"
    puts "What do you wanna add?"
    gift = gets.chomp
    christmas_list << {gift_name: gift, status: "not_bought"}
  when "ideas"
# ask user for what kind of product
# store answer
# get top answers from etsy
# display to user
# ask user for one to add get answer and store item in the wishlist
    puts "What are you searching on Etsy?"
    search_item = gets.chomp
    etsy_results = search_on_etsy(search_item)
    puts "which one would you like to add? type a number (1-5)"
    choice = gets.chomp.to_i
    christmas_list << {gift_name: etsy_results[choice -1], status: "not_bought"}

  when "check"
    christmas_list.each_with_index do |gift, index|
      if gift[:status] == "bought"
        puts "[x] #{gift[:gift_name]}"
      else
        puts "[ ] #{gift[:gift_name]}"
      end
    end
  when "delete"
    display_list(christmas_list)
    puts "which number do you want to delete?"
    delete_number = gets.chomp.to_i
    christmas_list.delete_at(delete_number -1)
  when "status"
    display_list(christmas_list)
    puts "which number do you want to select?"
    select_number = gets.chomp.to_i
    if christmas_list[select_number -1][:status] == "bought"
      christmas_list[select_number -1][:status] = "unbought"
    else
      christmas_list[select_number -1][:status] = "bought"
    end
  end
end


# # besser: info über gekauft oder nicht (bought / not_bought) als boolean speichern
# true or false
# dann unten chenge status:
# #    status = !status

# Step 4 - Find ideas on Etsy 🎁🎁🎁🎁
# You are out of ideas for Christmas and you want to find inspiration from Etsy. Add a new action idea to your menu (additionally to the list, add, delete and mark actions). Here is how this action could work:


# WHEN "idea"
# puts "What are you looking for on Etsy?"
# search_item = gets.chomp

# ...

# puts "here are your Etsy results for #{search_item}"
# 1
# 2
# 3
# 4
# puts "pick number to add to your list"
# 2
# "vintage jeans added to your list"
# What are you looking for on Etsy?
# > Jeans
# Here are Etsy results for "Jeans":
# 1 - Levis Blue Jeans
# 2 - Vintage Jeans
# 3 - Cargo Jeans Pants
# 4 - White Jeans
# etc.
# Pick one to add to your list (give the number)
# > 2
# "Vintage Jeans" added to your wishlist
# For the scraper, here is a starting script to help you extract the data:

# # scraping_etsy.rb
# require "open-uri"
# require "nokogiri"

# puts "What are you searching on Etsy?"
# article = gets.chomp

# # 1. We get the HTML file thanks to open-uri
# file = open("https://www.etsy.com/search?q=#{article}")

# # 2. We build a Nokogiri document from this file
# doc = Nokogiri::HTML(file)

# # 3. We search every elements with class="card" in our HTML doc

# doc.search(".card").each do |card|
#   # 4. for each element found, we extract its title and print it
#   title = card.search(".card-title").text.strip
#   puts title
# end
# Feel free to scrape another website adapting this script.
# Also, you can scrape other information than just the name (for example the price of the item).






