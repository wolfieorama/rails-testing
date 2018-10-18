# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  subject {build(:user)}

  describe "#add_to_cart!" do
    let(:album) {create(:album)}
    let(:user) {create(:user)}

    it "is expected to have quantity 1 after adding one item" do
      user.add_to_cart! album
      expect(user.cart_items.size).to eq(1)
    end
    
    it "is expected to have quantity 2 after adding two items" do
      2.times { user.add_to_cart! album }
      expect(user.cart_items.size).to eq(1)
    end
  end

  describe "#remove_from_cart!" do
    let(:album) {create(:album)}
    let(:user) {create(:user)}
    let!(:cart_item) {create(:cart_item, quantity: 2, user: user, album: album)}

    it "is expected to have quantity 1 after removing one item" do
      user.remove_from_cart! album
      expect(user.cart_items.find(cart_item.id).quantity).to eq(1)
    end

    it "is expected to have cart item destroyed after removing all items" do
      cart_item.quantity.times { user.remove_from_cart! album }
      expect(user.cart_items).not_to include(cart_item)
    end
  end

  context "validation" do
    it "Is valid with all necesary user details" do
      expect(subject).to be_valid
    end

    it "Is not valid with this kind of email" do
      subject.email = ''
      expect(subject).to_not be_valid
    end

    it "Is not valid with this kind of email" do
      subject.email = '123@'
      expect(subject).to_not be_valid
    end
  end

  context "email validation" do
    it "converts user email to downcase" do
      user =  create(:user, upcased: true)
      expect(user.email).to eq(user.email.downcase)
    end
  end 
end
