class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /items
  def index
    @items = Item.all
    @items.each do |item|
      if (item.id.to_s.length) == 1
        url_number = "00" + item.id.to_s
      elsif (item.id.to_s.length) == 2
        url_number = "0" + item.id.to_s
      else
        url_number = item.id.to_s.to_s
      end
      file_name = item.picture_file_name.to_s
      item.update(url: "http://localhost:3000/system/items/pictures/000/000/#{url_number}/original/#{file_name}")
    end
    render json: @items
  end

  # GET /items/1
  def show
    if (@item.id.to_s.length) == 1
      url_number = "00" + @item.id.to_s
    elsif (@item.id.to_s.length) == 2
      url_number = "0" + @item.id.to_s
    else
      url_number = @item.id.to_s.to_s
    end
    file_name = @item.picture_file_name.to_s
    @item.update(url: "http://localhost:3000/system/items/pictures/000/000/#{url_number}/original/#{file_name}")
    render json: @item
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    # @item.update(url: "test")

    if @item.save
      render json: @item, status: :created, location: @item
      # http://localhost:3000/system/items/pictures/000/000/003/original/USPWeather.jpg?1510952103
      # @item.id
      # @item.picture_file_name
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.fetch(:item, {})
    end
end
