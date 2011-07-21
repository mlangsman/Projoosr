class FixVideoId < ActiveRecord::Migration
  def self.up
    rename_column :videos, :video_id, :panda_video_id
  end

  def self.down
  end
end
