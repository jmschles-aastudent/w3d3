class CreateLongUrls < ActiveRecord::Migration
  def change
    create_table :long_urls do |t|
      t.string :long_url
      t.integer :short_url_id

      t.timestamps
    end
  end
end
