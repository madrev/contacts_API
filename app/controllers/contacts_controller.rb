class ContactsController < ApplicationController
  def index
    @contacts = Contact.where(user_id: params[:user_id])
    @contacts << User.find_by(id: params[:user_id]).received_contacts
    render json: @contacts
  end

  def create
    @contact = Contact.new(params.require(:contact).permit(:name, :email, :user_id))
    if @contact.save
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.update(contact_params)
    render json: @contact
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: @contact
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end
end


private
def contact_params
  params.require(:contact).permit(:name, :email)
end
