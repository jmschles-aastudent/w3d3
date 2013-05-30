class AddCommentToShortUrls < ActiveRecord::Migration
  def change
    add_column :short_urls, :comment, :string
  end
end
