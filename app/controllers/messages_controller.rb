class MessagesController < ApplicationController
  def new
    @message = Message.new(contact_id: params[:contact_id])
    @contact = params[:contact_name]
  end

  def create
    if Message.create(body: params[:body], contact_id: params[:contact_id])
      flash[:success] = "Message sent!"
      redirect_to contacts_path
    else
      @message = Message.new(contact_id: params[:contact_id], body: params[:body])
      @contact = params[:contact_name]
      flash.now[:danger] = "Failed to send. Please try again later."
      render :new
    end
  end
end
