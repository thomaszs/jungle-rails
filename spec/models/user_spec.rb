require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create an valid user' do
      user = User.create(
        first_name: "Thomas",
        last_name: "Zhang",
        email: "1@1.1",
        password: "12345",
        password_confirmation: "12345"

        )
      expect(user).to (be_valid)
    end

    it 'should have matching password and password confirmation' do
      password = User.create(
        first_name: "Thomas",
        last_name: "Zhang",
        email: "1@1.1",
        password: "12345",
        password_confirmation: "12345"
        )
      expect(password).to_not be_equal(password.password_confirmation)
    end

    it 'should have unique email' do
      @user1 = User.create(
        first_name: "Thomas",
        last_name: "Zhang",
        email: "lalala@a.com",
        password: "12345",
        password_confirmation: "12345"
        )
      @user2 = User.create(
        first_name: "T",
        last_name: "Z",
        email: "lalaLa@A.com",
        password: "12345",
        password_confirmation: "12345"
        )
    expect(@user2).to_not be_valid
    end

 
    it 'should have a password with a minimum length of 3' do
      user = User.create(
        first_name: "Thomas",
        last_name: "Zhang",
        email: "1@1.1",
        password: "1",
        password_confirmation: "1"
        )
      expect(user).to_not be_valid
    end

    describe '.authenticate_with_credentials' do
      user = User.create(
        first_name: "Thomas",
        last_name: "Zhang",
        email: "1@1.1",
        password: "12345",
        password_confirmation: "12345"
        )
      authenticate = User.authenticate_with_credentials(user.email, user.password)
      expect(authenticate).to_not be_valid
    end
  end
end