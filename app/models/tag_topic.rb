class TagTopic < ActiveRecord::Base
  attr_accessible :tag_name

  has_many :taggings
  has_many :short_urls, :through => :taggings
end
