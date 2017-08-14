# scraping_etsy.rb
require "open-uri"
require "nokogiri"




def search_on_etsy(search_item)
  etsy_list = []
# 1. We get the HTML file thanks to open-uri
  file = open("https://www.etsy.com/search?q=#{search_item}")
# 2. We build a Nokogiri document from this file
  doc = Nokogiri::HTML(file)
# 3. We search every elements with class="card" in our HTML doc
  doc.search(".js-merch-stash-check-listing").first(5).each do |card|
  # 4. for each element found, we extract its title and print it
    etsy_list << card.search(".card-meta-row").text.strip
  end
# Feel free to scrape another website adapting this script.
# Also, you can scrape other information than just the name (for example the price of the item).
  etsy_list.each_with_index do |item, index|
    puts "#{index + 1} - #{item}"
  end
  return etsy_list
end

def scraping_letscookfrench(ingredient)
    html_file = open("http://www.letscookfrench.com/recipes/find-recipe.aspx?s=#{ingredient}&type=all")
    html_doc = Nokogiri::HTML(html_file)
     html_doc.search('.m_contenu_resultat').first(10).each do |element|
      description = element.search(".m_titre_resultat").text.strip
      p description
    #   title = element.search("").text.strip

#      puts element.attribute('href')
    end
end

scraping_letscookfrench("strawberry")

