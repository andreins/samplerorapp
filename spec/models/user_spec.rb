require 'rails_helper'

RSpec.describe User, type: :model do

  context 'when creating a new invalid user' do
    it 'should fail if the name is blank' do
      user = User.new(username:'    ', email:'sam@kcl.ac.uk',
                      password:'qertywu67', password_confirmation:'qertywu67')
      expect(user.valid?).to eq(false)
    end

    it 'should fail if the name is too long (more than 55 chars)' do
      user = User.new(username:'qwertyuiopoiuytrewqwertyuiopoiuytrewqwertyuiopoiuytrewqasdfghjklpoiuytrewqasdfghjkl', email:'sam@kcl.ac.uk',
                      password:'qertywu67', password_confirmation: 'qertywu67')
      expect(user.valid?).to eq(false)
    end

    it 'should fail if email is invalid format' do
      user = User.new(username:'kylexx', email:'sam.uk',
                      password:'qertywu67', password_confirmation: 'qertywu67')
      expect(user.valid?).to eq(false)
    end

    it 'should fail if passwords dont match' do
      user = User.new(username:'faure', email:'sam@kcl.ac.uk',
                      password:'qertyw2222', password_confirmation:'qertywu67')
      expect(user.valid?).to eq(false)
    end

    it 'should fail if password is too short' do
      user = User.new(username:'andyxxx', email:'sam@kcl.ac.uk',
                      password:'qert', password_confirmation:'qert')
      expect(user.valid?).to eq(false)
    end
  end

  context 'when creating a new valid user' do
    it 'should succed with valid parameters' do
      user = User.new(username:'Samm', email:'sam@kcl.ac.uk',
                      password:'qertywu67', password_confirmation:'qertywu67')
      expect(user.valid?).to eq(false)
    end
  end


end
