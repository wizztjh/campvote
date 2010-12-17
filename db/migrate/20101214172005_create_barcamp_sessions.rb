class CreateBarcampSessions < ActiveRecord::Migration
  def self.up
    create_table :barcamp_sessions do |t|
      t.string :hash_tag
      t.string :name
      t.string :email
      t.string :handphone
      t.string :since

      t.timestamps
    end
  end

  def self.down
    drop_table :barcamp_sessions
  end
end
