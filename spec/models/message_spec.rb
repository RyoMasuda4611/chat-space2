require 'rails_helper'

describe Message do
  describe '#create' do
    it 'should be valid with body' do
      message = build(:message)
      expect(message).to be_valid
    end
    it 'should be invalid without body' do
      message = build(:message, body: '')
      expect(message).to_not be_valid
    end
  end
  describe 'association' do
    it 'belongs to group' do
      group = create(:group)
      message = build(:message, group: group)
      expect(message.group).to eq group
    end
    it 'belongs to user' do
      user = create(:user)
      message = build(:message, user: user)
      expect(message.user).to eq user
    end
  end
end