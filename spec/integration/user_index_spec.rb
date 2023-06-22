require 'rails_helper'

RSpec.describe 'User Page Index', type: :feature do
  before :each do
    @tom = User.create(
      name: 'Tommy',
      photo: 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80',
      bio: 'Teacher',
      posts_counter: 3
    )
    @lilly = User.create(
      name: 'Lilly',
      photo: 'https://images.unsplash.com/photo-1597223557154-721c1cecc4b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      bio: 'Teacher',
      posts_counter: 0
    )
    visit root_path
  end

  it 'shows username of users' do
    expect(page).to have_content(@tom.name)
    expect(page).to have_content(@lilly.name)
  end

  it 'shows the photo of each user' do
    assert page.has_xpath?("//img[@src = 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80'
    and @alt='user photo']")
    assert page.has_xpath?("//img[@src = 'https://images.unsplash.com/photo-1597223557154-721c1cecc4b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'
    and @alt = 'user photo']")
  end

  it 'shows the users posts' do
    expect(page).to have_content('Number of posts: 3')
  end

  it 'redirects to users show page' do
    click_on 'Tommy'
    expect(page).to have_current_path user_path(@tom)
    expect(page).to have_content('Teacher')
  end
end
