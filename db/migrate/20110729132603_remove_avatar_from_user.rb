class RemoveAvatarFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :avatar
  end

  def self.down
    add_column :users, :avatar, :string
  end
end
