require 'rails_helper'

feature 'Admin edits car_category' do
  scenario 'successfully' do
    CarCategory.create!(name: 'Compacto', daily_rate: 39.00,
                       car_insurance: 19.00, third_party_insurance: 14.00)

    visit root_path
    click_on 'Categorias'
    click_on 'Compacto'
    click_on 'Editar'

    fill_in 'Nome', with: 'Compacto'
    fill_in 'Diária', with: 39.00
    fill_in 'Seguro do carro', with: 29.00
    fill_in 'Seguradora de terceiros', with: 19.00
    click_on 'Enviar'

    expect(page).to have_content('Compacto')
    expect(page).to have_content(39.00)
    expect(page).to have_content(29.00)
    expect(page).to have_content(19.00)
  end

  scenario 'and must fill in all fields' do
    CarCategory.create!(name: 'Compacto', daily_rate: 39.00,
                       car_insurance: 19.00, third_party_insurance: 14.00)

    visit root_path
    click_on 'Categorias'
    click_on 'Compacto'
    click_on 'Editar'

    fill_in 'Nome', with: ''
    fill_in 'Diária', with: ''
    fill_in 'Seguro do carro', with: ''
    fill_in 'Seguradora de terceiros', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Você deve corrigir os seguintes erros:')
  end

  scenario 'and must be unique' do
    CarCategory.create!(name: 'Compacto', daily_rate: 39.00,
                       car_insurance: 19.00, third_party_insurance: 14.00)
    CarCategory.create!(name: 'Pequeno', daily_rate: 45.00,
                       car_insurance: 34.00, third_party_insurance: 24.00)

    visit root_path
    click_on 'Categorias'
    click_on 'Compacto'
    click_on 'Editar'

    fill_in 'Nome', with: 'Pequeno'

    click_on 'Enviar'

    expect(page).to have_content('Nome já está em uso')
  end


end
