class AddCountryToClassrooms < ActiveRecord::Migration
  def change
    add_column :classrooms, :country, :string
  end
end
