class PhonesController < ApplicationController
  def new
    contact = Contact.find(params[:contact_id])
    @phone = contact.phones.new
    render('phones/new.html.erb')
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @phone = Phone.create(:number => params[:number],
                          :contact_id => params[:contact_id])
    if @phone.save
      redirect_to("/contacts/#{@contact.id}")
    else
      render('phones/new.html.erb')
    end
  end

  def edit
    @phone = Phone.find(params[:id])
    render('phones/edit.html.erb')
  end

  def update
    @contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:id])
    if @phone.update(params[:phone])
      redirect_to("/contacts/#{@contact.id}")
    else
      render('phones/edit.html.erb')
    end
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @phone = Phone.find(params[:id])
    @phone.destroy
    redirect_to("/contacts/#{@contact.id}")
  end
end
