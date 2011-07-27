class ChangeUserIdFormatInVideos < ActiveRecord::Migration
  def self.up
    change_column :videos, :user_id, :integer
  end

  def self.down
    change_column :videos, :user_id, :string
  end
end
