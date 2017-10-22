require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:contact) { { id: "123456789", full_name: "Test Contact" } }

  describe "GET new" do
    it "instantiates new message" do
      get :new, params: { contact_id: contact[:id], contact_name: contact[:full_name] }
      message = assigns(:message)
      expect(message.class).to eq(Message)
      expect(message.contact_id).to eq(contact[:id])
    end
  end

  describe "POST create" do
    it "redirects to root path" do
      post :create, params: { contact_id: contact[:id], body: "Test Message" }
      expect(response).to redirect_to(root_path)
    end
  end
end
