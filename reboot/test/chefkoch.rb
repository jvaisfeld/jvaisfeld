require "open-uri"
require "nokogiri"

puts "which category?"
category = gets.chomp

html_file = open("http://www.chefkoch.de/rs/s0/#{category}/Rezepte.html")
html_doc = Nokogiri::HTML(html_file)


recipes = html_doc.search('.search-list-item-content')
html_doc.search('.search-list-item-content').each do |element|
  difficulty = element.search(".search-list-item-difficulty").text
  preptime = element.search(".search-list-item-preptime").text
  puts "#{preptime} - #{difficulty}"
  #puts element.attribute('href')
end
