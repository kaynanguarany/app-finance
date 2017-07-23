require "rails_helper"

RSpec.describe "Categories", type: :request do
  before do
    @category = Category.create(name: "The first category") 
  end

  describe "GET categories/:id" do
    
    context "With an existing category" do
      before {get "/categories/#{@category.id}"}

      it "handles existing category" do
        expect(response.status).to eq(200)
      end
    end

    context "With an non existing category" do
      before {get "/categories/xxx"}

      it "handles a non existing category" do
        expect(response.status).to eq(404)
        flash_message = "A categoria não foi encontrada"
        expect(flash[:alert]).to eq(flash_message)
      end
    end
  end
end