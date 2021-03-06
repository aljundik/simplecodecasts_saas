class ContactsController < ApplicationController
   def new
       @contact = Contact.new
   end
   
   def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      name = params[:contact][:name]# get the quires from the form and and assign it to name parameter// this synatx called hashes , where contacts are the hashe's name and name is the key valu
      email = params[:contact][:email]
      body = params[:contact][:comments]
    
      ContactMailer.contact_email(name, email, body).deliver# pass  the parameters to ContactMailer class contact_email message in particular
      flash[:success] = 'Message sent.'
      redirect_to new_contact_path
      
    else
      flash[:danger] = 'Error occured, message has not been sent.'
      redirect_to new_contact_path
    end
  
end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end