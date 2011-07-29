class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :avatar
      t.string :first_name, :default => ""
      t.string :last_name, :default => ""
      t.string :website_url, :default => ""
      t.string :location, :default => ""
      t.text :bio, :default => ""
      
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
