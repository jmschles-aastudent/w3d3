class TagTopic < ActiveRecord::Base
  attr_accessible :tag_name

  validates :tag_name, :presence => true,
                       :length => { :maximum => 10 }

  has_many :taggings
  has_many :short_urls, :through => :taggings
end
