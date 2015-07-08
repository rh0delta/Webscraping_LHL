require './post.rb'
require './comment.rb'
require 'nokogiri'
require 'open-uri'

def to_split(object, delimiter)
  object.join.split(delimiter)
end

@url = ARGV[0]
PAGE = Nokogiri::HTML(open(@url))
@title = PAGE.css('title')[0]

@points = PAGE.search('.subtext > span:first-child')
@item_id = PAGE.search('.subtext > a:nth-child(3)').map {|link| link['href'] }
post = Post.new(@title.text, @url, @points.text, to_split(@item_id, "=")[1])




PAGE.search('.default').map do |font|
  user_name = font.search('.comhead > a:first-child').text
  comment_text = font.search('font:first-child').inner_text

  comment = Comment.new(user_name, comment_text)
  post.add_comment(comment)
end




puts "Post Title: #{post.title}"
puts "Number of comments: #{post.comments.length}"
puts "Points: #{post.points}"
# puts "Comments: "
# post.comments.each {|comm| puts comm.to_s}
