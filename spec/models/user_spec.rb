require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test' do

    it 'successfully create' do
      user = User.generate().save
      expect(user).to eq(true)
    end 

    it 'valid adjectives' do
      user = User.generate()
      adjectives = ['Ancient', 'Creative', 'Dangerous', 'Effective', 'Flying', 'Gilded']
      sp = user.username.split('-')[0]
      expect(adjectives).to include(sp) 
    end

    it 'valid nouns' do
      user = User.generate()
      nouns = ['Highway', 'Intern', 'Jackhammer', 'Lion', 'Master']
      sp = user.username.split('-')[1]
      expect(nouns).to include(sp) 
    end

  end

  
end