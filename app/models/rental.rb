class Rental < ApplicationRecord
  validates :client_id, presence: { message: 'Não pode ficar em branco'}
  validates :car_category_id, presence: { message: 'Não pode ficar em branco'}
  validates :start_date, presence: { message: 'Não pode ficar em branco'}
  validates :end_date, presence: { message: 'Não pode ficar em branco'}


  belongs_to :car_category
  belongs_to :client
end
