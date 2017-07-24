class FoodCart < ApplicationRecord
  belongs_to :owner
  belongs_to :location

end
