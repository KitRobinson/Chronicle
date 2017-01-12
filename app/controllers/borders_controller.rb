class BordersController < ApplicationController
  before_action :set_border, only: [:show, :edit, :update, :destroy]

  # GET /borders
  # GET /borders.json
  def index
    @borders = Border.all
  end

  # GET /borders/1
  # GET /borders/1.json
  def show
  end

  # GET /borders/new
  def new
    @border = Border.new
  end

  # GET /borders/1/edit
  def edit
  end

  # POST /borders
  # POST /borders.json
  def create
    @border = Border.new(border_params)

    respond_to do |format|
      if @border.save
        format.html { redirect_to @border, notice: 'Border was successfully created.' }
        format.json { render :show, status: :created, location: @border }
      else
        format.html { render :new }
        format.json { render json: @border.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borders/1
  # PATCH/PUT /borders/1.json
  def update
    respond_to do |format|
      if @border.update(border_params)
        format.html { redirect_to @border, notice: 'Border was successfully updated.' }
        format.json { render :show, status: :ok, location: @border }
      else
        format.html { render :edit }
        format.json { render json: @border.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borders/1
  # DELETE /borders/1.json
  def destroy
    @border.destroy
    respond_to do |format|
      format.html { redirect_to borders_url, notice: 'Border was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_border
      @border = Border.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def border_params
      params.require(:border).permit(:province_id, :neighbor_id, :defense)
    end
end
