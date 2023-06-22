require 'rails_helper'

RSpec.describe 'User Page Index', type: :feature do
  before :each do
    @tom = User.create(
      name: 'Tommy',
      photo: 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80',
      bio: 'Teacher',
      posts_counter: 3
    )
    @post1 = Post.create(title: 'Hello', text: 'My world', comments_counter: 0, likes_counter: 0, user_id: @tom.id,
                         author_id: @tom.id)
    @post2 = Post.create(title: 'Hi', text: 'My earth', comments_counter: 0, likes_counter: 0, user_id: @tom.id,
                         author_id: @tom.id)
    @post3 = Post.create(title: 'Hey', text: 'My universe', comments_counter: 0, likes_counter: 0, user_id: @tom.id,
                         author_id: @tom.id)
    visit user_path(@tom.id)
  end

  it 'shows the profile picture of the user' do
    assert page.has_xpath?("//img[@src = 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80'
     and @alt='user photo']")
  end

  it 'shows the username' do
    expect(page).to have_content(@tom.name)
  end

  it 'shows number of posts written by user' do
    expect(page).to have_content("Number of posts: #{@tom.posts_counter}")
  end

  it 'shows users bio' do
    expect(page).to have_content('Teacher')
  end

  it 'shows last three posts of user' do
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post3.title)
  end

  it 'shows button for seeing all posts' do
    expect(page).to have_link('See all posts')
  end

  it 'redirects to post show page upon click' do
    click_on 'Hello'
    expect(page).to have_current_path user_post_path(@tom.id, @post1.id)
  end

  it 'redirects to user posts index page on click of see all post button' do
    click_link('See all posts')
    expect(page).to have_current_path user_posts_path(@tom.id)
  end
end
