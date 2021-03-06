class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code
      t.date :start_date
      t.date :end_date
      t.integer :program_id
      t.integer :classroom_id
      t.string :color

      t.timestamps
    end
  end
end
