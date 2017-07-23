require "rails_helper"

RSpec.feature "Listing categories" do
  before do
    @category1 = Category.create(name: "The first category") 
    @category2 = Category.create(name: "The second category") 
  end

  scenario "A user lists all categories" do
    visit '/categories'
    expect(page).to have_content(@category1.name)
    expect(page).to have_content(@category2.name)

    expect(page).to have_link(@category1.name)
    expect(page).to have_link(@category2.name)
  end

  scenario "A user has no categories" do
    Category.delete_all

    visit '/categories'
    expect(page).not_to have_content(@category1.name)
    expect(page).not_to have_content(@category2.name)

    expect(page).not_to have_link(@category1.name)
    expect(page).not_to have_link(@category2.name)

    within("h2#no-categories") do
      expect(page).to have_content("Não há categorias criadas")
    end
  end
end