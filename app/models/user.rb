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

class User < ApplicationRecord
    validates :email, presence: true, email: true
    validates :name, presence: true, uniqueness: true
    
    before_validation -> {email.downcase!}
end
