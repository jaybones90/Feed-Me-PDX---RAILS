class FoodCart < ApplicationRecord
  belongs_to :owner
  has_many :locations

end
