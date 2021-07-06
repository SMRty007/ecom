class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[ index show]
  # GET /products or /products.json
  def index
    @products = Product.all
    @product = Product.new
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    authorize @product
  end

  # GET /products/1/edit
  def edit
    current_user.products.find(params[:id])
    authorize Product
  end

  # POST /products or /products.json
  def create
    @product = current_user.products.new(product_params)
    authorize @product
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end

  end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    current_user.products.find(params[:id])
    authorize @product
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    authorize @product
    current_user.products.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
    end
  end
  def add_to_cart
    cart = current_user.carts.new
    cart.product_id = params[:id]
    cart.save
    redirect_to products_path
  end
  def remove_from_cart
    cart = current_user.carts.where(product_id: params[:id]).first
    cart.destroy
    redirect_to products_path
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:user_id, :product_name, :product_amount, :product_info)
    end
end
