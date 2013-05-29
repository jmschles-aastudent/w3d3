class LongUrl < ActiveRecord::Base
  attr_accessible :long_url

  has_many :short_urls

  validates :long_url, :uniqueness => true
end
