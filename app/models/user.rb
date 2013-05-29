class User < ActiveRecord::Base
  attr_accessible :username

  validates :username, :presence => true,
                       :uniqueness => true,
                       :length =>  { :in => 2..10 }

  has_many :short_urls

end
