class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :classroom_id
      t.integer :course_id

      t.timestamps
    end
  end
end
