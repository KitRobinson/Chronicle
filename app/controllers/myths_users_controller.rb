class MythsUsersController < ApplicationController
  before_action :set_myths_user, only: [:show, :edit, :update, :destroy]

  # GET /myths_users
  # GET /myths_users.json
  def index
    @myths_users = MythsUser.all
  end

  # GET /myths_users/1
  # GET /myths_users/1.json
  def show
  end

  # GET /myths_users/new
  def new
    @myths_user = MythsUser.new
  end

  # GET /myths_users/1/edit
  def edit
  end

  # POST /myths_users
  # POST /myths_users.json
  def create
    @myths_user = MythsUser.new(myths_user_params)

    respond_to do |format|
      if @myths_user.save
        format.html { redirect_to @myths_user, notice: 'Myths user was successfully created.' }
        format.json { render :show, status: :created, location: @myths_user }
      else
        format.html { render :new }
        format.json { render json: @myths_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /myths_users/1
  # PATCH/PUT /myths_users/1.json
  def update
    respond_to do |format|
      if @myths_user.update(myths_user_params)
        format.html { redirect_to @myths_user, notice: 'Myths user was successfully updated.' }
        format.json { render :show, status: :ok, location: @myths_user }
      else
        format.html { render :edit }
        format.json { render json: @myths_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /myths_users/1
  # DELETE /myths_users/1.json
  def destroy
    @myths_user.destroy
    respond_to do |format|
      format.html { redirect_to myths_users_url, notice: 'Myths user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_myths_user
      @myths_user = MythsUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def myths_user_params
      params.require(:myths_user).permit(:user_id, :myth_id, :access_level)
    end
end
