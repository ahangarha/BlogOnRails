require 'rails_helper'

RSpec.describe User, type: :model do
  the_user = User.new(
    name: 'Omid',
    photo: 'https://via.placeholder.com/150',
    bio: 'Some text as bio!',
    posts_counter: 0
  )

  context 'user.name' do
    it 'has some value' do
      the_user.name = nil
      expect(the_user).to_not be_valid
    end

    it 'is not blank' do
      the_user.name = '    '
      expect(the_user).to_not be_valid
    end

    it 'accepts "Omid"' do
      the_user.name = 'Omid'
      expect(the_user).to be_valid
    end
  end

  context 'user.posts_counter' do
    it 'has some value' do
      the_user.posts_counter = nil
      expect(the_user).to_not be_valid
    end

    it 'is integer' do
      the_user.posts_counter = 1.2
      expect(the_user).to_not be_valid
    end

    it 'accepts 0 and 10' do
      [0, 10].each do |counter|
        the_user.posts_counter = counter
        expect(the_user).to be_valid
      end
    end
  end
end
