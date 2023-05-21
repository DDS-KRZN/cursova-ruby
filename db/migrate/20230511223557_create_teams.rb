class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :department, null: false, foreign_key: true
      t.references :director, null: false, foreign_key: { to_table: :people }

      t.timestamps
    end
  end
end
