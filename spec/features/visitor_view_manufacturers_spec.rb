require 'rails_helper'

feature 'Visitor view manufacturers' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '123456')

    login_as(user, scope: :user)
    #Arrange
    Manufacturer.new(name: 'Fiat').save
    Manufacturer.create(name: 'Volkswagen')
    #Act
    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    #Assert
    expect(page).to have_content('Fiat')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    user = User.create!(email: 'test@test.com', password: '123456')

    login_as(user, scope: :user)
    Manufacturer.create(name: 'Fiat')
    Manufacturer.create(name: 'Volkswagen')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Voltar'

    expect(current_path).to eq manufacturers_path
  end

  scenario 'and manufacturers are not registered' do
    user = User.create!(email: 'test@test.com', password: '123456')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Fabricantes'

    expect(page).to have_content('Não existem filiais cadastradas no '\
                                  'sistema.')
  end
end
