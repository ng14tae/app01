class ProductsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def index
    @products = Product.includes(:user)
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to products_path, success: t("defaults.flash_message.created", item: Product.model_name.human)
    else
      flash.now[:danger] = t("defaults.flash_message.not_created", item: Product.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def update
    @product = current_user.products.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product), success: t("defaults.flash_message.updated", item: Product.model_name.human)
    else
      flash.now[:danger] = t("defaults.flash_message.not_updated", item: Product.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    product = current_user.products.find(params[:id])
    product.destroy!
    redirect_to products_path, success: t("defaults.deleted", item: Product.model_name.human), status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:title, :body, :url)
  end

  def not_authenticated
    redirect_to login_path, danger: t("defaults.require_login") if current_user.nil?
  end
end
