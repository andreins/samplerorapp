require 'rails_helper'

RSpec.describe User, type: :model do

  context 'when creating a new invalid user' do
    it 'should fail if the name is blank' do
      user = User.new(username:'    ', email:'sam@kcl.ac.uk')
            expect(user.valid?).to eq(false)
    end

    it 'should fail if the name is too long (more than 55 chars)' do
      user = User.new(username:'qwertyuiopoiuytrewqwertyuiopoiuytrewqwertyuiopoiuytrewqasdfghjklpoiuytrewqasdfghjkl',
                      email:'sam@kcl.ac.uk')
      expect(user.valid?).to eq(false)
    end

    it 'should fail if email is invalid format' do
      user = User.new(username:'kylexx', email:'sam.uk')
      expect(user.valid?).to eq(false)
    end

    it 'should fail if the username is not unique' do
      user1 = User.new(username: 'test', email:'test@yahoo.com')
      user2 = User.new(username: 'test', email: 'test2@yahoo.com')
      user1.save!
      expect(user2.valid?).to eq(false)
    end

    it 'should fail if the email is not unique' do
      user1 = User.new(username: 'test1', email: 'test@test.com')
      user2 = User.new(username: 'test2', email: 'test@test.com')
      user1.save!
      expect(user2.valid?).to eq(false)
    end

  end

  context 'when creating a new valid user' do
    it 'should succed with valid parameters' do
      user = User.new(username:'Samm', email:'sam@kcl.ac.uk')
      expect(user.valid?).to eq(true)
    end
  end


end
