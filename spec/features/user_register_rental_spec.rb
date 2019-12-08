require 'rails_helper'

feature 'User register rental' do
  scenario 'successfully' do
    Client.create!(name: 'Kelly', cpf: '009.870.960-79', email: 'kelly@gmail.com')
    CarCategory.create!(name: 'Compacto', daily_rate: 39.00,
                       car_insurance: 19.00, third_party_insurance: 14.00)

    visit root_path
    click_on 'Filiais'
    click_on 'Locação'
    click_on 'Fazer nova locação'

    fill_in 'Data de início', with: '05-12-2019'
    fill_in 'Data final', with: '08-12-2019'
    select 'Kelly', from: 'Cliente'
    select 'Compacto', from: 'Categoria'

    click_on 'Enviar'

    expect(page).to have_content('Locação realizada com sucesso')
    expect(page).to have_content('Kelly')
    expect(page).to have_content('2019-12-05')
    expect(page).to have_content('2019-12-08')
  end
end
