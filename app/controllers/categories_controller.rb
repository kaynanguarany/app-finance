class CategoriesController < ApplicationController
  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
    @category.save
    flash[:success] = "Categoria cadastrada com sucesso"
    redirect_to categories_path
  end

  private

    def params_category
      params.require(:category).permit(:name, :opening_balance)
    end
end
