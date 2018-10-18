require 'rails_helper'

RSpec.describe "albums/new" do
    subject {build(:album)}

    before :each do
        assign(:album, [subject])
        render
    end 

    it "return the correct form with the correct ID" do
        expect(rendered).to have_selector('#new_album', count: '1')
    end 

    it "displays the page tilte" do
        expect(rendered).to have_selector('h1', text: 'New Album')
    end
end