class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @categories = Category.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @categories = Category.all
    categories = Category.where("id = ? ", @item.category_id)
    categories.each do |category| 
      @category = category
    end
  end

  # GET /items/categoryfilter/1
  # GET /items/categoryfilter/1.json
  def categoryfilter
    category_id = params[:id]
    @items = Item.where("category_id = ? ", category_id)
    @categories = Category.all
  end

  # GET /items/discount
  def discountfilter
    @items = Item.where("discount > 0")
    @categories = Category.all
  end

  # POST /items/search
  def search
    @keyword = params[:keyword]
    @items = Item.where("name LIKE ? OR description LIKE ?", "%#{@keyword}%", "%#{@keyword}%")
    @categories = Category.all
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:category_id, :name, :manufacturer, :price, :colour, :size, :discount, :description, :picture, :popularity, :stock, :hold)
    end
end
