class Project < ApplicationRecord
  belongs_to :leader,class_name: 'Person', foreign_key: 'leader_id'
end
