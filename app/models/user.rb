class User < ActiveRecord::Base
  attr_accessible :username, :email

  validates :username, :presence => true,
                       :uniqueness => true,
                       :length => { :in => 2..10 }

  validates :email, :presence => true,
                    :uniqueness => true,
                    :email => true

  has_many :short_urls
  has_many :visits

end
