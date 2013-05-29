class RemoveShortUrlFromLongUrls < ActiveRecord::Migration
  def change
    change_table :long_urls do |t|
      t.remove :short_url_id
    end
  end
end
