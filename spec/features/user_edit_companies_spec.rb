require 'rails_helper'

feature 'User edit companies' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    visit edit_company_path(company)

    fill_in 'Nome',      with: 'Novo nome'
    fill_in 'Local',     with: 'Nova localização'
    fill_in 'Email',     with: 'novo@email.com'
    fill_in 'Telefone',  with: '1234-1234'

    click_on 'Atualizar Empresa'

    expect(page).to have_css('h1', text: 'Novo nome')
    expect(page).to have_content('Nova localização')
    expect(page).to have_content('novo@email.com')
    expect(page).to have_content('1234-1234')
  end

  scenario 'with valid data' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    visit edit_company_path(company)

    fill_in 'Nome', with: ''
    fill_in 'Email', with: ''

    click_on 'Atualizar Empresa'

    expect(page).to have_content 'Não foi possível atualizar a empresa'
  end
end
