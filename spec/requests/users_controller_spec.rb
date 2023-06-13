require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'user index action' do
    before :each do
      get users_path
    end

    it 'should check if status was correct' do
      expect(response).to have_http_status(200)
    end

    it 'should check if correct index template is rendered' do
      expect(response).to render_template(:index)
    end

    it 'should check if response body includes correct placeholder text' do
      expect(response.body).to include('This is the Users index page')
    end
  end

  context 'user show action' do
    before :each do
      @user = User.create(name: 'Tom', photo: 'photo', bio: 'Teacher from Mexico.', posts_counter: 1)
      get user_path(@user.id)
    end

    it 'should check if status was correct' do
      expect(response).to have_http_status(200)
    end

    it 'should check if correct index template is rendered' do
      expect(response).to render_template(:show)
    end

    it 'should check if response body includes correct placeholder text' do
      expect(response.body).to include('This is the Users show page')
    end
  end
end