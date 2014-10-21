class AddCityToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :city, :string
  end
end
