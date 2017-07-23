require "rails_helper"

RSpec.feature "Show category" do
  before do
    @category = Category.create(name: "The first category") 
  end

  scenario "Showing a especific category" do
    visit "/categories"
    click_link @category.name
    expect(page).to have_content(@category.name)
    expect(current_path).to eq(category_path(@category))
  end
end