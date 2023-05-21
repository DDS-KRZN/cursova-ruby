class Person < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  has_many :departments, dependent: :destroy
  has_many :teams
  has_many :projects
  has_many :people_in_teams
end
