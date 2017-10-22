require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe "GET index" do
    it "should retrieve contacts" do
      get :index
      contacts = assigns(:contacts)
      expect(contacts.class).to eq(Array)
      expect(contacts.first[:id]).not_to be nil
    end
  end
end
