class EmailsController < ApplicationController
  def new
    contact = Contact.find(params[:contact_id])
    @email = contact.emails.new
    render('emails/new.html.erb')
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @email = Email.create(:address => params[:address],
                          :contact_id => params[:contact_id])
    if @email.save
      redirect_to("/contacts/#{@contact.id}")
    else
      render('emails/new.html.erb')
    end
  end

  def edit
    @email = Email.find(params[:id])
    render('emails/edit.html.erb')
  end

  def update
    @email = Email.find(params[:id])
    if @email.update(params[:email])
      redirect_to("/contacts/#{@contact.id}")
    else
      render('emails/edit.html.erb')
    end
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to("/contacts/#{@contact.id}")
  end
end
