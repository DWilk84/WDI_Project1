class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :all_day, :default => false
      t.string :color
      t.integer :classroom_id
      t.integer :course_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
