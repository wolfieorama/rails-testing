# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Album do

  subject {build(:album)}

  context "validation" do
    it "is not valid without a title" do
      subject.title = ''
      expect(subject).not_to be_valid
    end 

    it "is not valid if the subject titls is over 100 letter" do
      subject.title = "a" * 101
      expect(subject).not_to be_valid
    end 

    it "is valid with all proper data" do
      expect(subject).to be_valid
    end
  end 
end
