class Tagging < ActiveRecord::Base
  attr_accessible :tag_topic, :short_url

  validates :tag_topic_id, :presence => true
  validates :short_url_id, :presence => true

  belongs_to :tag_topic
  belongs_to :short_url
end
