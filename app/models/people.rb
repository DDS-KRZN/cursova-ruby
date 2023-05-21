class People < ApplicationRecord
  has_many :people_in_teams
  has_many :teams, through: :people_in_teams
end
