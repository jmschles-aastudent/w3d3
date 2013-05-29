class AddLongUrlToShortUrls < ActiveRecord::Migration
  def change
    add_column :short_urls, :long_url_id, :integer
  end
end
