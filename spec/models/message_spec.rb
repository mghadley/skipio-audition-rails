require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:contact) { { id: "123456789", full_name: "Test Contact" } }

  describe "new" do
    it "should instantiate a new message" do
      message = Message.new(contact_id: contact[:id])
      expect(message.contact_id).to eq(contact[:id])
    end
  end

  describe "create" do
    it "should send text message" do
      response = Message.create(contact_id: contact[:id], body: "Test message")
      expect(response).to be true
    end
  end
end
