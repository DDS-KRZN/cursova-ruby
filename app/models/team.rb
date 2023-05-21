class Team < ApplicationRecord
  belongs_to :department
   belongs_to :director,class_name: 'Person', foreign_key: 'director_id'

  #для доступа до списку членів команди
 has_many :people_in_teams
  has_many :people, through: :people_in_teams

end
