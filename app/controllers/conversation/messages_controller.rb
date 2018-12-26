class Conversation::MessagesController < ApplicationController
  before_action :set_conversation_message, only: [:show, :edit, :update, :destroy]

  # GET /conversation/messages
  # GET /conversation/messages.json
  def index
    @conversation_messages = Conversation::Message.all
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
    @conversation_message = Conversation::Message.new(conversation_message_params)

    respond_to do |format|
      if @conversation_message.save
        format.html { redirect_to @conversation_message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @conversation_message }
      else
        format.html { render :new }
        format.json { render json: @conversation_message.errors, status: :unprocessable_entity }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation_message
      @conversation_message = Conversation::Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_message_params
      params.require(:conversation_message).permit(:conversation_id, :sender_id, :content)
    end
end
