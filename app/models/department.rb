class Department < ApplicationRecord
  belongs_to :company
  #каждый департамент принадлежит
  # определенному директору, который является экземпляром
  # модели Person
  belongs_to :director,class_name: 'Person'
end
