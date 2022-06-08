require 'rails_helper'

RSpec.describe Post, type: :model do
  the_author = User.create!(
    name: 'Omid',
    photo: 'https://via.placeholder.com/150',
    bio: 'Some text as bio!',
    posts_counter: 0
  )
  the_post = Post.new(
    user: the_author,
    title: 'The post title',
    text: 'the body of the post',
    comments_counter: 0,
    likes_counter: 0
  )

  it 'must have title' do
    the_post.title = nil
    expect(the_post).to_not be_valid
  end

  it 'must have a non-blank title' do
    the_post.title = '    '
    expect(the_post).to_not be_valid
  end

  it 'cannot have title longer than 250 characters' do
    the_post.title = 'a' * 251
    expect(the_post).to_not be_valid
  end

  it 'accepts "The post title" as title' do
    the_post.title = 'The post title'
    expect(the_post).to be_valid
  end

  context 'post.comments_counter' do
    it 'has some value' do
      the_post.comments_counter = nil
      expect(the_post).to_not be_valid
    end

    it 'is integer' do
      the_post.comments_counter = 1.2
      expect(the_post).to_not be_valid
    end

    it 'accpets 0 and 10' do
      [0, 10].each do |counter|
        the_post.comments_counter = counter
        expect(the_post).to be_valid
      end
    end
  end

  context 'post.likes_counter' do
    it 'has some value' do
      the_post.likes_counter = nil
      expect(the_post).to_not be_valid
    end

    it 'is integer' do
      the_post.likes_counter = 1.2
      expect(the_post).to_not be_valid
    end

    it 'accpets 0 and 10' do
      [0, 10].each do |counter|
        the_post.likes_counter = counter
        expect(the_post).to be_valid
      end
    end
  end
end
