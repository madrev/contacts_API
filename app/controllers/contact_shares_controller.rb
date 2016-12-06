class ContactSharesController < ApplicationController
  def create
    @share = ContactShare.new(params.require(:contact_share).permit(:user_id, :contact_id))
    if @share.save
      render json: @share
    else
      render(
        json: @share.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @share = ContactShare.find_by(id: params[:id])
    @share.destroy
    render json: @share
  end

end
