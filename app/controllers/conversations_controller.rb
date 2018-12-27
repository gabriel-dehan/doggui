class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized
  # GET /conversations
  # GET /conversations.json
  def index
    find_dog
    if @dog.user == current_user
      @conversations = policy_scope(@dog.conversations).reverse
    end
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
    find_dog
    @conversation = @dog.conversations.build
    @conversation.save!
    @message = @conversation.messages.build(params.permit(:content).merge(sender: current_user) )
    respond_to do |format|
      if @message.save
        # format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        format.json { render 'conversation/messages/show', status: :created }
      else
        # format.html { render :new }
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

    def find_dog
      @dog = Dog.find(params[:dog_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit(:dog)
    end
end
