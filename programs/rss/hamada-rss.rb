require 'rss'

rss_feeds = RSS::Parser.parse "http://www.city.hamada.shimane.jp/www/rss/news.rdf", false

search_word = ARGV[0].chomp

rss_feeds.items.each do |feed|
  if feed.title =~ /#{search_word}/
    puts feed.title
    puts feed.link
  end
end