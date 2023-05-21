class Department < ApplicationRecord
  belongs_to :company
  belongs_to :director, class_name: 'Person', foreign_key: 'director_id'

end
