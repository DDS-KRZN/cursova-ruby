class Department < ApplicationRecord
  belongs_to :company
  belongs_to :director, class_name: 'People'
end
