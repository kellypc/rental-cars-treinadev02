class Rental < ApplicationRecord
  belongs_to :car_category
  belongs_to :client
end
