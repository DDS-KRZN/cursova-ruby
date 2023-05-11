class Team < ApplicationRecord
  belongs_to :department
  belongs_to :director
end
