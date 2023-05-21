class AddPersonIdToDepartments < ActiveRecord::Migration[7.0]
  def change
    add_reference :departments, :person, null: false, foreign_key: true

  end
end
