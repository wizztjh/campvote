class CreateVoters < ActiveRecord::Migration
  def self.up
    create_table :voters do |t|
      t.string :name
      t.integer :barcamp_session_id
      t.boolean :vote
      t.timestamps
    end
  end

  def self.down
    drop_table :voters
  end
end
