class Person < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  has_many :leaders, foreign_key: :leader_id
  has_many :departments, foreign_key: :director_id
end
