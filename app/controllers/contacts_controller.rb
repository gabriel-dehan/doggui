class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    authorize @contact
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Merci pour votre message. Nous le traiterons dans les meilleurs délais !'
    else
      flash.now[:error] = 'Nous ne parvenons pas à envoyer votre message.'
      render :new
    end
  end

private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
