class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.sent_message(@contact).deliver
      flash[:success] = "Thank you for your message"
      redirect_to root_url
    else
      render 'contacts/new'
    end
  end
  
  private

    def contact_params
      params.require(:contact).permit(:name, :age, :email, :content)
    end
end
