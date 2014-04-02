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
      render('phones/success.html.erb')
    else
      render('phones/new.html.erb')
    end
  end

  def edit
    @phone = Phone.find(params[:id])
    render('phones/edit.html.erb')
  end

  def update
    @phone = Phone.find(params[:id])
    if @phone.update(params[:phone])
      render('phones/success.html.erb')
    else
      render('phones/edit.html.erb')
    end
  end
end
