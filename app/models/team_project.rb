class TeamProject < ApplicationRecord
  belongs_to :team
  belongs_to :project
end
