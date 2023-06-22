require 'rails_helper'

RSpec.describe 'Post Page Index', type: :feature do
  before :each do
    @tom = User.create(
      name: 'Tommy',
      photo: 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80',
      bio: 'Teacher',
      posts_counter: 3
    )
    @post = Post.create(title: 'Hello', text: 'My world', comments_counter: 0, likes_counter: 0, user_id: @tom.id,
                        author_id: @tom.id)
    5.times do
      Comment.create(post: @post, author: @tom, text: 'hello yimi', user_id: @tom.id, post_id: @post.id,
                     author_id: @tom.id)
    end
    visit user_post_path(@tom.id, @post.id)
  end

  it 'shows the title of a post' do
    expect(page).to have_content(@post.title)
  end

  it 'shows the writer of the post' do
    expect(page).to have_content("by #{@tom.name}")
  end

  it 'shows the number of comments for the post' do
    expect(page).to have_content('Comments: 5')
  end

  it 'shows the number of likes for the post' do
    expect(page).to have_content('Likes: 0')
  end

  it 'shows the body of the post' do
    expect(page).to have_content('My world')
  end

  it 'shows the username of each commentor' do
    expect(page).to have_content(@tom.name)
  end

  it 'shows comment of each commentor' do
    expect(page).to have_content('hello yimi')
  end
end
