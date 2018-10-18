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
