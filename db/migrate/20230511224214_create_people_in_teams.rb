class CreatePeopleInTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :people_in_teams do |t|
      t.references :team, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
