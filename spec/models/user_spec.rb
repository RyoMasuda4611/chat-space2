require 'rails_helper'
describe User do
  describe '#create' do
    it "should be valid" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "should be invalid without nickname" do
      user = build(:user, nickname: "")
      expect(user).to_not be_valid
    end
    it "should be invalid without email" do
      user = build(:user, email: "")
      expect(user).to_not be_valid
    end

    it "should be invalid without password" do
      user = build(:user, password: "")
      expect(user).to_not be_valid
    end
    it "should be invalid without password_confirmation" do
      user = build(:user, password_confirmation: "")
      expect(user).to_not be_valid
    end
    it "should be invalid with deferent password and password_confirmation" do
      user = build(:user, password_confirmation: "11111111")
      expect(user).to_not be_valid
    end
    it "should be invalid with duplicated email" do
      create(:user)
      duplicated_user = build(:user)
      expect(duplicated_user).to_not be_valid
    end

    it "should be invalid with password that has less than 7 characters" do
      user = build(:user, password: "1111")
      expect(user).to_not be_valid
    end
  end
end
