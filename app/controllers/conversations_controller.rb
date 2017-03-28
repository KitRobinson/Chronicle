class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  before_filter :authorize
  before_filter :authorizeAdmin, only: [:edit, :update, :destroy]
  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations
  # POST /conversations.json
  def create
    puts "conversation params"
    puts "------------------------------"
    puts conversation_params

    puts "params"
    puts "------------------------------"
    puts params

    puts "deities"
    puts "-------------------------------"
    puts params["conversation"]["deity"]
    selected = []
    params["conversation"]["deity"].each do |name, is_selected|
      selected << name if is_selected == "1"
    end
    puts selected
    selected_users = []
    selected.each do |this_name|
      selected_users << User.where(username: this_name).first
    end
    puts selected_users

    @conversation = Conversation.new(conversation_params)
    @conversation.users = selected_users

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.fetch(:conversation, {})
      params.permit(:conversation, {})      
    end
end
