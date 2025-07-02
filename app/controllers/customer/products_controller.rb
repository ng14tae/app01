class Customer::ProductsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

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

  private

  def product_params
    params.require(:product).permit(:title, :body)
  end
end
