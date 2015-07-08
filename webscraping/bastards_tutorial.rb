require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "https://en.wikipedia.org/wiki/HTML"

# page = Nokogiri::HTML(open(PAGE_URL))

# puts page.css("title")[0].name
# puts page.css("title")[0].text

# puts page.css("title")[0].name

# puts "============================================"

# links = page.css("a")
# puts links.length
# puts links[0].text
# puts links[0]["href"]
# puts "============================================"

# news_links = page.css('a').select{|link| link['data-category'] == "news"}
# news_links.each {|link| puts link['href']}

# puts news_links.class

# puts "============================================"

# news_links = page.css('a[data-category=news]')
# news_links.each{|link| puts link['href']}

# puts news_links.class

puts "============================================"

# links = page.css('div#references a')
# links.each {|link| puts "#{link.text}\t#{link['href']}"}

puts "============================================"

page_wiki = Nokogiri::HTML(open(PAGE_URL))
page_wiki.css('div#content div#bodyContent table.infobox tr th').each do |link|
  puts link.text
end
