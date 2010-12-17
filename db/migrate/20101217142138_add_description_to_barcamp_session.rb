class AddDescriptionToBarcampSession < ActiveRecord::Migration
  def self.up
    add_column :barcamp_sessions, :description, :text
  end

  def self.down
    remove_column :barcamp_sessions, :description
  end
end
