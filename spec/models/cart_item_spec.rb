require 'rails_helper'

RSpec.describe CartItem do
  
  subject { build(:cart_item) }

  context "validation" do
    it "should not be valid without user" do
      subject.user = nil
      expect(subject).to_not be_valid
    end

    it "should not be valid without album" do
      subject.album = nil
      expect(subject).to_not be_valid
    end

    it "should be valid with all things in order" do
      expect(subject).to be_valid
    end
  end

  context"duplicating records" do
    let!(:duplicated_record) { create(:cart_item, user: subject.user, album: subject.album) }
    it "should not have duplicated user" do
      expect(subject).to_not be_valid
    end 
  end

end
