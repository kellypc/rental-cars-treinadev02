require 'rails_helper'

feature 'Admin view subsidiaries' do
  scenario 'successfully' do
    user = User.create!(email: 'test@test.com', password: '123456')

    login_as(user, scope: :user)
    #Arrange
    Subsidiary.create!(name: 'Almeidinha Cars', cnpj: '00.000.000/0000-00',
                       address: 'Alameda Santos, 1293')
    #Act
    visit root_path
    click_on 'Filiais'
    click_on 'Almeidinha Cars'
    #Assert
    expect(page).to have_content('Almeidinha Cars')
    expect(page).to have_content('00.000.000/0000-00')
    expect(page).to have_content('Alameda Santos, 1293')
  end

  scenario 'and subsidiaries are not registered' do
    visit root_path
    click_on 'Filiais'

    expect(page).to have_content('Não existem filiais cadastradas no '\
                                  'sistema.')


  end
end
