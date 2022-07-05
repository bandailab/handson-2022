require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with a name and email" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid if the password is less than 8 characters" do
    user = FactoryBot.build(:user, password: 'a')
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
  end

  it "is invalid without a password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid without a email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a duplicate email address" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.build(:user)
    user2.valid?
    expect(user2.errors[:email]).to include("has already been taken")
  end
end
