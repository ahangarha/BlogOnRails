require 'rails_helper'

RSpec.describe User, type: :model do
  the_user = User.new(
    name: 'Omid',
    photo: 'https://via.placeholder.com/150',
    bio: 'Some text as bio!',
    posts_counter: 0
  )

  it 'must have name' do
    the_user.name = nil
    expect(the_user).to_not be_valid
  end

  it 'must have a non-blank name' do
    the_user.name = '    '
    expect(the_user).to_not be_valid
  end

  it 'accepts "Omid" as a valid name' do
    the_user.name = 'Omid'
    expect(the_user).to be_valid
  end

  it 'must have PostsCounter' do
    the_user.posts_counter = nil
    expect(the_user).to_not be_valid
  end

  it 'must have integer PostsCounter' do
    the_user.posts_counter = 1.2
    expect(the_user).to_not be_valid
  end

  it 'accepts zero PostsCounter' do
    the_user.posts_counter = 0
    expect(the_user).to be_valid
  end

  it 'accepts positive integer PostsCounter' do
    the_user.posts_counter = 10
    expect(the_user).to be_valid
  end
end
