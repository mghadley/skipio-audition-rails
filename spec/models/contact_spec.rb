require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "all" do
    it "should return array of contacts" do
      contacts = Contact.all
      expect(contacts.empty?).to be false
      expect(contacts.first[:id]).to be_truthy
    end
  end  
end
