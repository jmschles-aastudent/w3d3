class RenameVisitedIdToShortUrlIdInVisits < ActiveRecord::Migration
  def change
    rename_column :visits, :visited_url_id, :short_url_id
  end
end
