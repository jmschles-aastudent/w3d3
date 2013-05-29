class Visit < ActiveRecord::Base
  attr_accessible :user, :short_url

  belongs_to :short_url
  belongs_to :user

  validates :user_id, :presence => true
  validates :short_url_id, :presence => true

end
