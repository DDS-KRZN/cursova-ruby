class Team < ApplicationRecord
  belongs_to :department
  has_many :people_in_teams
  has_many :peoples, through: :people_in_teams
end
