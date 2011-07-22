class AddPublishedToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :published, :boolean
  end

  def self.down
    remove_column :videos, :published
  end
end
