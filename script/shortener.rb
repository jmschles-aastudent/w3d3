def login
  puts "'C' to create a new user, or 'L' to log in an existing one: "
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
  short_url_text = gets.chomp
  short_url = ShortUrl.where( :short_url => short_url_text ).first
  Visit.create( :user => current_user, :short_url => short_url )
  Launchy.open( short_url.long_url.long_url )
end

def choose_action(current_user)
  puts "It's time to choose! "
  puts "'S' to obtain a short URL to use, or "
  puts "'O' to open a webpage from an existing short URL. "
  choice = gets.chomp.downcase
  case choice
  when 's'
    long_url_handler(current_user)
  when 'o'
    short_url_handler(current_user)
  end
end

current_user = login
while true
  choose_action(current_user)
end