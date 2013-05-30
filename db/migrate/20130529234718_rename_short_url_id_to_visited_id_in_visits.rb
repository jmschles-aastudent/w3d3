class RenameShortUrlIdToVisitedIdInVisits < ActiveRecord::Migration
  def change
    rename_column :visits, :short_url_id, :visited_url_id
  end
end
