class CreateTimetables < ActiveRecord::Migration
  def self.up
    create_table :timetables do |t|
      t.timestamp :from
      t.timestamp :to
      t.integer :barcamp_session_id

      t.timestamps
    end
  end

  def self.down
    drop_table :timetables
  end
end
