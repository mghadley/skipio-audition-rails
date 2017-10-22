class MessagesController < ApplicationController
  def new
    @message = Message.new(contact_id: params[:contact_id])
    @contact = params[:contact_name]
  end

  def create
    if Message.create(body: params[:body], contact_id: params[:contact_id])
      flash[:success] = "Message sent!"
      redirect_to root_path
    else
      flash.now[:danger] = "Failed to send. Please try again later."
      redirect_to root_path
    end
  end
end
