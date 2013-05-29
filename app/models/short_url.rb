class ShortUrl < ActiveRecord::Base
  attr_accessible :long_url_id

  before_save :assign_url

  belongs_to :long_url

  validates :long_url_id, :presence => true

  def assign_url
    self.short_url = SecureRandom.urlsafe_base64
  end
end
