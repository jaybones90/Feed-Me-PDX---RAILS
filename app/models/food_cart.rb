class FoodCart < ApplicationRecord
  belongs_to :owner
  has_one :location

end
