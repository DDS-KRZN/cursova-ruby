class Project < ApplicationRecord
  belongs_to :leader,class_name: 'Person'
end
