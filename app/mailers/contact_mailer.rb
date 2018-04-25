class ContactMailer < ApplicationMailer
  
  default from: 'hak.app.contact@gmail.com'
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.sent_message.subject
  #
  def sent_message(contact)
    @contact = contact

    mail to: @contact.email,
         bcc: Settings.gmail[:mail],
         subject: "Thank you for your contact"
  end
end
