class MythsController < ApplicationController
  before_action :set_myth, only: [:show, :edit, :update, :destroy]

  before_filter :authorize
  before_filter :authorize_author, only: [:update, :destroy]

  # GET /myths
  # GET /myths.json
  def index
    @myths = Myth.all
  end

  # GET /myths/1
  # GET /myths/1.json
  def show
  end

  # GET /myths/new
  def new
    @myth = Myth.new
  end

  # GET /myths/1/edit
  def edit
  end

  # POST /myths
  # POST /myths.json
  def create
    @myth = Myth.new(myth_params)


    respond_to do |format|
      if @myth.save
        @myth.mythsUsers << MythsUser.create(user: current_user, access_level: 2)
        format.html { redirect_to @myth, notice: 'Myth was successfully created.' }
        format.json { render :show, status: :created, location: @myth }
      else
        format.html { render :new }
        format.json { render json: @myth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /myths/1
  # PATCH/PUT /myths/1.json
  def update
    respond_to do |format|
      if @myth.update(myth_params)
        format.html { redirect_to @myth, notice: 'Myth was successfully updated.' }
        format.json { render :show, status: :ok, location: @myth }
      else
        format.html { render :edit }
        format.json { render json: @myth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /myths/1
  # DELETE /myths/1.json
  def destroy
    @myth.destroy
    respond_to do |format|
      format.html { redirect_to myths_url, notice: 'Myth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_myth
      @myth = Myth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def myth_params
      params.require(:myth).permit(:myth_pic, :title, :content)
    end

    # only the author is permitted certain actions
    def user_access
      usr = MythsUser.where(user: current_user, myth: self).first
      if usr
        usr.access
      else
        0
      end
    end

    def authorize_author
      redirect_to '/login' unless user_access > 1 || current_user.access == 3
    end

    def authorize_collaborator
      redirect_to '/login' unless user_access > 0 || current_user.access == 3
    end
end
