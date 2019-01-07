class Conversation::MessagesController < ApplicationController
  before_action :set_conversation_message, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized

  # GET /conversation/messages
  # GET /conversation/messages.json
  def index
    find_conversation
    @conversation_messages = policy_scope(@conversation.messages).includes(:sender).order(:id)
    @conversation_messages
      .not_of_user(current_user)
      .update_all(is_read: true)
  end

  # GET /conversation/messages/1
  # GET /conversation/messages/1.json
  def show
  end

  # GET /conversation/messages/new
  def new
    @conversation_message = Conversation::Message.new
  end

  # GET /conversation/messages/1/edit
  def edit
  end

  # POST /conversation/messages
  # POST /conversation/messages.json
  def create
    find_conversation
    @message = @conversation.messages.build(params.permit(:content).merge(sender: current_user))

    respond_to do |format|
      if @message.save
        broadcast_conversation
        broadcast_channel
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversation/messages/1
  # PATCH/PUT /conversation/messages/1.json
  def update
    respond_to do |format|
      if @conversation_message.update(conversation_message_params)
        format.html { redirect_to @conversation_message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation_message }
      else
        format.html { render :edit }
        format.json { render json: @conversation_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversation/messages/1
  # DELETE /conversation/messages/1.json
  def destroy
    @conversation_message.destroy
    respond_to do |format|
      format.html { redirect_to conversation_messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def broadcast_conversation
    ConversationChannel.broadcast_to(
      @conversation,
      {
        conversation: @conversation.id,
        message: @message,
        user_id: current_user.id
      })
  end

  def broadcast_channel
    ChatChannel.broadcast_to(
      @conversation.dog,
      {
        conversation: @conversation.id,
        unread_messages: @conversation.messages.of_user(current_user).not_read.count
      })
  end

    def find_conversation
      conversation = Conversation.find(params[:conversation_id])
      @conversation = conversation if conversation.messages.pluck(:user_id).include?(current_user.id) || conversation.dog.user == current_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation_message
      @conversation_message = Conversation::Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_message_params
      params.require(:conversation_message).permit(:conversation_id, :sender_id, :content)
    end
end
