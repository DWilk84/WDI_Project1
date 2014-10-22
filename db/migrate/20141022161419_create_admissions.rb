class CreateAdmissions < ActiveRecord::Migration
  def change
    create_table :admissions do |t|
      t.integer :course_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
