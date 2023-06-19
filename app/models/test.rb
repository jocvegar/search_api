class Test < ApplicationRecord
  validates_presence_of :name
  validates_numericality_of :age
end
