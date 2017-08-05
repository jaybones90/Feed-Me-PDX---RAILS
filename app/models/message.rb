class Message < ApplicationRecord
  belongs_to :subscriber
  has_many :replies

end
