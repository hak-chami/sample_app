class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(content_params)
    if @contact.save
      flash[:success] = "Thank you for your message"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  private

    def contact_params
      params.require(:contact).permit(:content, :email, :content)
    end
end
