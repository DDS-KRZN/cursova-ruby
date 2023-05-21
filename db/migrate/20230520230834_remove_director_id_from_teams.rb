class RemoveDirectorIdFromTeams < ActiveRecord::Migration[7.0]
  def change
    remove_column :teams, :director_id
  end

end
