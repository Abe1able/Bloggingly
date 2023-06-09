require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 1)
  end

  it 'name must not be blank' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'check if posts counter is an integer' do
    @user.posts_counter = 'ham'
    expect(@user).to_not be_valid
  end

  it 'checks if bio is present' do
    @user.bio = 'hello'
    expect(@user).to be_valid
  end

  describe 'check methods' do
    before do
      @user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher',
                           posts_counter: 0)
      5.times do
        Post.create(title: 'Hi', text: 'My world', likes_counter: 0, user_id: 1, author_id: 1)
      end
    end

    it 'returns last three posts' do
      expect(@user1.three_posts).to match_array(@user1.posts.last(3))
    end
  end
end
