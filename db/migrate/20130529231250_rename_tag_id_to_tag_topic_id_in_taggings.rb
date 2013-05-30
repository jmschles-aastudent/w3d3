class RenameTagIdToTagTopicIdInTaggings < ActiveRecord::Migration
  def change
    rename_column :taggings, :tag_id, :tag_topic_id
  end
end
