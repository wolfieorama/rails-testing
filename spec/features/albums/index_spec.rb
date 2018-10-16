require 'rails_helper'

RSpec.feature 'Album list' do
    scenario "unathenticated user" do
        visit albums_path
        within '#content' do
            expect(find('h1')).to have_content('Albums')
        end
    end
end