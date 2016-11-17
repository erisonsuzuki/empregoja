require 'rails_helper'

feature 'User edit categories' do
  scenario 'successfully' do
    category = Category.create(name: 'Front-end')

    visit edit_category_path(category)

    fill_in 'Nome', with: 'Back-end'

    click_on 'Atualizar Categoria'

    expect(page).to have_css('h1', text: 'Front-end')
  end

  scenario 'with valid data' do
    category = Category.create(name: 'Front-end')

    visit edit_category_path(category)

    fill_in 'Nome', with: ''

    click_on 'Atualizar Categoria'

    expect(page).to have_content 'Não foi possível atualizar a categoria'
  end
end
