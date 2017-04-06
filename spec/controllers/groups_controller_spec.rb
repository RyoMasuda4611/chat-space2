require 'rails_helper'
describe GroupsController, type: :controller do
  describe 'GET #new' do
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'POST #create' do
    before do
      post :create, group: attributes_for(:group)
    end
    it 'save the new contact in databases' do
      expect{ post :create, group: attributes_for(:group) }.to change(Group, :count).by(1)
    end
    it 'renders the root template' do
      expect(response).to redirect_to root_path
    end
  end

  describe 'GET #edit' do
    let(:group){ create(:group) }
    before do
      get :edit, id: group
    end
    it 'assigns the requested group to @group' do
      expect(assigns(:group)).to eq group
    end
    it 'renders the :edit template' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #update' do
    let(:group){ create(:group) }
    context 'with valid parameter' do
      before do
        patch :update, id: group, group: attributes_for(:group, name: 'test')
      end
      it 'redirect to the root_path' do
        expect(response).to redirect_to root_path
      end
      it 'is updated' do
        group.reload
        expect(group.name).to eq 'test'
      end
    end
    context 'with invalid parameter' do
      before do
        patch :update, id: group, group: attributes_for(:group, name: '')
      end
      it 'is not updated' do
        group.reload
        expect(group.name).not_to eq nil
      end
    end
  end
end
