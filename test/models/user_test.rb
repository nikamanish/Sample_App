require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: "Manish Nikam", email: "nikamanish@gmail.com", password: "manish", password_confirmation: "manish")
  end

  test "should be valid" do
  	#puts @user.valid?
    assert @user.valid?
  end

  test "name should be present" do
  	@user.name = "   "
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = "    "
  	assert_not @user.valid?
  end

  test "name should not be too long" do
  	@user.name = "a"*51
  	assert_not @user.valid?
  end  

  test "email should not be too long" do
  	@user.email = "a"*256
  	assert_not @user.valid?
  end

  test "email validation should  accept valid email" do
  	valid_addresses = %w[USER@foo.COM THE_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
  	valid_addresses.each do |valid_address|
  		@user.email = valid_address
  		assert @user.valid?, "#{valid_address} is not valid"
  	end
  end

  test "email validation should reject invalid emails" do
  	invalid_addresses = %w[user@example,com user_at_foo.com user.name@example. foo@bar_baz.com foo@bar+baz.com]
  	invalid_addresses.each do |invalid_address|
  		@user.email = invalid_address
  		assert_not @user.valid?, "#{invalid_address} should be invalid"
  	end
  end

  test "email should be unique" do
  	dupliate_user = @user.dup
  	@user.save
  	assert_not dupliate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
  	mixed_case_email = "Foo@ExAmplE.coM"
  	@user.email = mixed_case_email
  	@user.save
  	assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should have a minimum length" do
  	@user.password = @user.password_confirmation = "a" * 5
  	assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end
end