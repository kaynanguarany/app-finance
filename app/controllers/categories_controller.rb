class CategoriesController < ApplicationController
  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_category)
    if @category.save
      flash[:success] = "Categoria cadastrada com sucesso"
      redirect_to categories_path
    else
      flash.now[:danger] = "Categoria nao pode ser cadastrada"
      render :new
    end
  end

  private

    def params_category
      params.require(:category).permit(:name, :opening_balance)
    end
end
