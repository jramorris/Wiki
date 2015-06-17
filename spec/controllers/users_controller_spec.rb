require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe "POST #create" do
	  it "rejects invalid password length" do
	 		user = User.create(name: "james",
	 											 email: "james@example.com", 
	 											 password: "foo", 
	 											 password_confirmation: "foo"
	 											)
	  	expect(user.save).to be false 
	  end

	  it "rejects user when password and confirmation don't match" do
	  	user = User.create(name: "james",
		 											 email: "james@example.com", 
		 											 password: "foobar", 
		 											 password_confirmation: "foobars"
		 											)
	  	expect(user.save).to be false
	  end

		it "rejects user with blank name" do
			user = User.create(name: "",
	 											 email: "james@example.com", 
	 											 password: "foobar", 
	 											 password_confirmation: "foobar"
	 											)
			expect(user.save).to be false
		end

		it "rejects user with invalid email address" do
			user = User.create(name: "james",
		 											 email: "james@@example.com", 
		 											 password: "foobar", 
		 											 password_confirmation: "foobar"
		 											)
			expect(user.save).to be false
		end

		it "accepts new user with valid attributes" do
			user = User.create(name: "james",
	 											 email: "james@example.com", 
	 											 password: "foobar", 
	 											 password_confirmation: "foobar"
	 											)
			expect(user.save).to be true
		end
	end
end