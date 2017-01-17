class OrganizationsProvincesController < ApplicationController
  before_action :set_organizations_province, only: [:show, :edit, :update, :destroy]

  # GET /organizations_provinces
  # GET /organizations_provinces.json
  def index
    @organizations_provinces = OrganizationsProvince.all
  end

  # GET /organizations_provinces/1
  # GET /organizations_provinces/1.json
  def show
  end

  # GET /organizations_provinces/new
  def new
    @organizations_province = OrganizationsProvince.new
  end

  # GET /organizations_provinces/1/edit
  def edit
  end

  # POST /organizations_provinces
  # POST /organizations_provinces.json
  def create
    @organizations_province = OrganizationsProvince.new(organizations_province_params)

    respond_to do |format|
      if @organizations_province.save
        format.html { redirect_to @organizations_province, notice: 'Organizations province was successfully created.' }
        format.json { render :show, status: :created, location: @organizations_province }
      else
        format.html { render :new }
        format.json { render json: @organizations_province.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations_provinces/1
  # PATCH/PUT /organizations_provinces/1.json
  def update
    respond_to do |format|
      if @organizations_province.update(organizations_province_params)
        format.html { redirect_to @organizations_province, notice: 'Organizations province was successfully updated.' }
        format.json { render :show, status: :ok, location: @organizations_province }
      else
        format.html { render :edit }
        format.json { render json: @organizations_province.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations_provinces/1
  # DELETE /organizations_provinces/1.json
  def destroy
    @organizations_province.destroy
    respond_to do |format|
      format.html { redirect_to organizations_provinces_url, notice: 'Organizations province was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organizations_province
      @organizations_province = OrganizationsProvince.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organizations_province_params
      params.require(:organizations_province).permit(:organization_id, :province_id)
    end
end
