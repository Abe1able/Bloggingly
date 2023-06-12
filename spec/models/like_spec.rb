require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0Bvo', bio: 'Teacher', posts_counter: 0)
    @post = Post.new(title: 'Hi', text: 'My wd', comments_counter: 0, likes_counter: 0, user_id: 1, author_id: 1)
    @comment = Comment.new(post: @post, author: @user, text: 'hello yimi', user_id: 1)
  end

  it 'checks validity of like present' do
    @like = Like.new(author_id: @user, post_id: @post)
    expect(@like).to_not be_valid
  end

  it 'checks likes counter' do
    Like.create(author_id: @user, post_id: @post)
    expect(@post.likes_counter).to eql(0)
  end
end
