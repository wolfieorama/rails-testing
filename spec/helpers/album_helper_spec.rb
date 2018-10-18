require 'rails_helper'

RSpec.describe "AlbumHelper" do
    let (:popular_album) { build(:popular_album) }
    let (:album) { build(:album) }

    context "with status" do
        it "should specially mark popular albums"  do
            popular_album.popular = true
            result = helper.with_status(popular_album)
            expect(result).to have_selector("small", text: "hot!")
        end

        it "should not be specially mark if not popular albums"  do
            result = helper.with_status(album)
            expect(result).to_not have_selector("small", text: "hot!")
        end
    end
end 