require "rails_helper"

RSpec.feature "Creating categories" do

  scenario "A user creates a new category" do
    visit "/"
    click_link "Nova Categoria"
    fill_in "Nome", with: "First category"
    fill_in "Saldo inicial", with: 10.00
    click_button "Criar categoria"

    expect(page).to have_content "Categoria cadastrada com sucesso"
    expect(current_path).to eq(categories_path)
  end
end