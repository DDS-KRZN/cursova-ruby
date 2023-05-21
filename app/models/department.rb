class Department < ApplicationRecord
  belongs_to :company
  belongs_to :director, class_name: 'People', foreign_key: "director_id"
  has_many :teams
end
