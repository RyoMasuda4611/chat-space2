require 'rails_helper'
describe MessagesController , type: :controller do
  let(:user){ create(:user) }
  before do
    login_user user
  end
  describe 'GET #index' do
    it 'assigns the requested contact to @messages' do
      user.groups = create_list(:group, 3)
      group = user.groups.first
      messages = create_list(:message, 3, group: group)
      get :index
      expect(assigns(:messages)).to eq messages
    end
    it 'renders the :index template' do
      user.groups = create_list(:group, 3)
      group = user.groups.first
      messages = create_list(:message, 3, group: group)
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'with valid parameter' do
      it 'save the new contact in databases' do
        expect{ post :create, message: attributes_for(:message) }.to change(Message, :count).by(1)
      end
      it 'renders the :index template' do
        post :create, message: attributes_for(:message)
        expect(response).to redirect_to root_path
      end
    end
    context 'with invalid parameter' do
      it 'renders the :index template' do
        post :create, message: attributes_for(:message, body: "")
        expect(response).to  redirect_to root_path
      end
    end
  end
end