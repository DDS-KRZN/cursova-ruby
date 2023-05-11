class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :descr
      t.references :leader, null: false, foreign_key: true
      t.date :deadline

      t.timestamps
    end
  end
end
