class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :city
      t.string :country
      t.integer :capacity
      

      t.timestamps
    end
  end
end
