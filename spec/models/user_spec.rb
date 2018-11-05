require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, and password" do
  	user = User.new(
  		name: "Finsa",
  		email: "finsa@example.com",
  		password: "1q2w3e4r5t")
  	expect(user).to be_valid
  end

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
end
