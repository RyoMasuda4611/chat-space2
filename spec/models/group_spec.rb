require 'rails_helper'

describe Group do
  describe 'validation' do
    it 'should be valid' do
      group = build(:group)
      expect(group).to be_valid
    end
    it 'should not be valid' do
      group = build(:group, name: '')
      expect(group).to_not be_valid
    end
  end
  describe 'association' do
    let(:group){ create(:group) }
    let(:user_group){ create(:user_group) }
    it 'is deleted with massages ' do
      message = create(:message, group: group)
      expect{ group.destroy }.to change{ Message.count }
    end
    it 'has many users' do
      users = build_list(:user, 3)
      group = create(:group, users: users)
      expect(group.users).to eq users
    end
  end
end