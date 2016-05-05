class ProductsController < ApplicationController

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		flash[:success] = "product added successfully"
  		redirect_to products_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@product = Product.find_by(params[:id])
  end

  def update
  	@product = Product.find_by(params[:id])
  	if @product.update_attributes(product_params)
  		flash[:success] = "updated successfully."
  		redirect_to products_path
  	else
  		render 'edit'
  	end
  end

  def index
  	@products = Product.all
    @order_item = current_order.order_items.new
  end

  def destroy
  	Product.find(params[:id]).destroy
    flash[:success] = "service deleted"
    redirect_to products_url
  end

  private

  def product_params
  	params.require(:product).permit(:name, :price, :photo)
  end

end
