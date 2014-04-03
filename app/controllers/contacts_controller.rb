class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    @contacts = Contact.all
    render('contacts/index.html.erb')
  end

  def show
    @contact = Contact.find(params[:id])
    render('contacts/show.html.erb')
  end

  def create
    @contact = Contact.create(params[:contact])
    if @contact.save
      redirect_to("/contacts/#{@contact.id}")
    else
     @contacts = Contact.all
     render('contacts/index.html.erb')
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    render('contacts/edit.html.erb')
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(params[:contact])
      redirect_to("/contacts/#{@contact.id}")
    else
      render('contacts/edit.html.erb')
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to("/contacts/")
  end
end




