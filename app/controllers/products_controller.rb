class ProductsController < ApplicationController
  impressionist :actions=>[:show]
  before_action :set_product, only: [:show, :edit, :update, :destroy, :bid, :buy, :buy_time]
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
      @product = Product.find(params[:id])
      if @product.buyer_id
        redirect_to root_path
      end

      @new_comment = Comment.build_from(@product, current_user.id, "")
    end


  def user_products
    @products = Product.where(:user_id, params[:user_id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  def buy
    respond_to do |format|
      @product.buyer_id = current_user.id
      if @product.update(:buyer_id => @product.buyer_id)
        format.html { redirect_to @product, notice: 'Product was successfully buyed.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
    end

    def buy_by_time
      respond_to do |format|
        @product.buyer_id = @product.bidder_id
        if @product.update(:buyer_id => @product.buyer_id)
          format.html { redirect_to @product, notice: 'Product was successfully buyed.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end

  end

  def bid
    respond_to do |format|
      @product_tmp = product_params
      if @product.bidmax.nil? || @product.bidmax < @product_tmp["price"].to_i
        if @product.bidmax.nil?
          @bidmaxtmp = @product.price
        else
          @bidmaxtmp = @product.bidmax
        end
        @product.bidmax = @product_tmp["price"].to_i
        @product_tmp["price"] = @bidmaxtmp +=1
        @product.bidder_id = current_user.id
        if @product.update(@product_tmp)
          format.html { redirect_to @product, notice: 'bid accepted.' }
          format.json { render :show, status: :ok, location: @product }
        else
          format.html { redirect_to @product, notice: 'insufficient bid !' }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      else
        if @product_tmp["price"].to_i > @product.price
          @bidtmp = @product_tmp["price"].to_i
          @bidtmp += 1
          @product_tmp["price"] = @bidtmp
          if  @product.update(@product_tmp)
            format.html { redirect_to @product, notice: 'An other bidder have the best bid.' }
            format.json { render :show, status: :ok, location: @product }
          else
            format.html { redirect_to @product, notice: 'oh non !' }
            format.json { render json: @product.errors, status: :unprocessable_entity }
          end
        else
          format.html { redirect_to @product, notice: 'insufficient bid !' }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
    end
  end



  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.build(product_params)
    @product.price = @product.price_minimum
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      puts params[:action]
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :user_id, :category_id, :price_minimum, :mini_bid, :immediate_price, :bidder_id, :bidding_date_end, :bidmax, :buyer_id)
    end

  end
