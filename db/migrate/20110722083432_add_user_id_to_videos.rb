class AddUserIdToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :user_id, :string
  end

  def self.down
    remove_column :videos, :user_id
  end
end
