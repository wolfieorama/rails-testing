require 'rails_helper'

RSpec.describe "albums/index" do

    subject {build(:album)}
    it "returns the albums partial" do
        assign(:albums, [subject, subject])
        render
        expect(view).to render_template(partial: '_album', count: '2')
    end

    it "displays Albums titles" do
        assign(:albums, [subject])
        render
        expect(rendered).to include(subject.title)
    end
end