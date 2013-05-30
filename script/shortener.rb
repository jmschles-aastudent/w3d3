def login
  puts "(C) to create a new user, or (L) to log in an existing one: "
  choice = gets.chomp.downcase
  case choice
  when 'c'
    puts "Enter a username: "
    username = gets.chomp.downcase
    puts "Enter your email: "
    email = gets.chomp.downcase
    User.create( :username => username, :email => email )
  when 'l'
    puts "Enter your username: "
    username = gets.chomp.downcase
    raise "Not a valid user" unless User.where( :username => username ).first
    User.where( :username => username ).first
  else
    puts "Invalid choice, have a nice day."
  end
end

def long_url_handler(current_user)
  puts "Enter a long URL: "
  long_url = gets.chomp.downcase
  LongUrl.create( :long_url => long_url )
  long_url_object = LongUrl.where( :long_url => long_url ).first

  if ShortUrl.link_exists?(current_user.id, long_url_object.id)
    short = ShortUrl.where( :user_id => current_user.id,
                            :long_url_id => long_url_object.id ).first
    puts short.short_url
  else
    short = ShortUrl.create( :user => current_user, :long_url => long_url_object )
    puts short.short_url
  end
end

def short_url_handler(current_user)
  puts "Enter a short URL to launch: "
  short_url = ShortUrl.where( :short_url => gets.chomp ).first
  Visit.create( :user => current_user, :short_url => short_url )
  Launchy.open( short_url.long_url.long_url )
end

def add_tag(current_user)
  puts "Enter a short url to tag: "
  short_url = ShortUrl.where( :user_id => current_user.id,
                              :short_url => gets.chomp ).first
  puts "Enter a tag from the following list: "
  puts "'news', 'funny', 'shopping', 'music', 'sports'"
  tag_name = gets.chomp.downcase
  tag_topic = TagTopic.where( :tag_name => tag_name ).first
  raise "Tag doesn't exist" unless tag_topic
  raise "Already tagged!" if short_url.tag_topics.include?(tag_topic)
  Tagging.create( :short_url => short_url, :tag_topic => tag_topic )
end

def add_comment

end

def get_stats
  puts "Enter a short URL to check out: "
  short_url = ShortUrl.where( :short_url => gets.chomp ).first
  num_visits = short_url.visits.count
  num_recent_visits = short_url.visits.where( "created_at > ?", Time.now - 10.minutes ).count
  associated_tags = short_url.tag_topics.map do |topic|
    topic.tag_name
  end.join(", ")

  puts "Number of visits: #{num_visits}"
  puts "Number of visits in last 10 minutes: #{num_recent_visits}"
  puts "Tags: #{associated_tags}"
end

def choose_action(current_user)
  puts "It's time to choose! "
  puts "(S) to obtain a short URL to use, "
  puts "(O) to open a webpage from an existing short URL, "
  puts "(T) to add a tag to a short URL, "
  puts "(G) to get stats about a short URL, or "
  puts "(C) to add a comment to a short URL."
  choice = gets.chomp.downcase
  case choice
  when 's'
    long_url_handler(current_user)
  when 'o'
    short_url_handler(current_user)
  when 't'
    add_tag(current_user)
  when 'g'
    get_stats
  end
end

current_user = login
while true
  begin
    choose_action(current_user)
  rescue StandardError => e
    puts "Error: #{e.message}"
    retry
  end
end