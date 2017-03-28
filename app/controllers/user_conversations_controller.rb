class UserConversationsController < ApplicationController
  before_action :set_user_conversation, only: [:show, :edit, :update, :destroy]

  # GET /user_conversations
  # GET /user_conversations.json
  def index
    @user_conversations = UserConversation.all
  end

  # GET /user_conversations/1
  # GET /user_conversations/1.json
  def show
  end

  # GET /user_conversations/new
  def new
    @user_conversation = UserConversation.new
  end

  # GET /user_conversations/1/edit
  def edit
  end

  # POST /user_conversations
  # POST /user_conversations.json
  def create
    @user_conversation = UserConversation.new(user_conversation_params)

    respond_to do |format|
      if @user_conversation.save
        format.html { redirect_to @user_conversation, notice: 'User conversation was successfully created.' }
        format.json { render :show, status: :created, location: @user_conversation }
      else
        format.html { render :new }
        format.json { render json: @user_conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_conversations/1
  # PATCH/PUT /user_conversations/1.json
  def update
    respond_to do |format|
      if @user_conversation.update(user_conversation_params)
        format.html { redirect_to @user_conversation, notice: 'User conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_conversation }
      else
        format.html { render :edit }
        format.json { render json: @user_conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_conversations/1
  # DELETE /user_conversations/1.json
  def destroy
    @user_conversation.destroy
    respond_to do |format|
      format.html { redirect_to user_conversations_url, notice: 'User conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_conversation
      @user_conversation = UserConversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_conversation_params
      params.require(:user_conversation).permit(:user_id, :conversation_id)
    end
end
