class ShortUrl < ActiveRecord::Base
  attr_accessible :long_url, :user

  before_save :assign_url

  belongs_to :long_url
  belongs_to :user
  has_many :visits

  validates :long_url_id, :presence => true
  validates :user_id, :presence => true

  def assign_url
    self.short_url = SecureRandom.urlsafe_base64
  end

  def self.link_exists?(user_id, long_url_id)
    !ShortUrl.where( :user_id => user_id, :long_url_id => long_url_id ).empty?
  end
end
