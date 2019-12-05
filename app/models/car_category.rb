class CarCategory < ApplicationRecord
  validates :name, presence: { message: 'Não pode ficar em branco'}
  validates :daily_rate, presence: { message: 'Não pode ficar em branco'}
  validates :car_insurance, presence: { message: 'Não pode ficar em branco'}
  validates :third_party_insurance, presence: { message: 'Não pode ficar em branco'}
  validates :name, uniqueness: { message: 'Nome já está em uso'}

  has_many :car_models
end
