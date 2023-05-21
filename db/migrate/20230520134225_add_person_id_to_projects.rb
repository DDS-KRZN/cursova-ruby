class AddPersonIdToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :person, null: false, foreign_key: true
  end
end
