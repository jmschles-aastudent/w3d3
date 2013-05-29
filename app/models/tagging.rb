class Tagging < ActiveRecord::Base
  attr_accessible :tag, :short_url

  belongs_to :tag_topic
  belongs_to :short_url
end
