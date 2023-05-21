class PeopleInTeam < ApplicationRecord
  belongs_to :people
  belongs_to :team
end
