class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
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

  protected  
    def resource_not_found
      message = "A categoria não foi encontrada" 
      flash[:alert] = message
      render "pages/404", status: 404
    end

  private

    def params_category
      params.require(:category).permit(:name, :opening_balance)
    end
end
