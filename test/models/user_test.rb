require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:one)
    @user.password="1234567890"
    @user.password_confirmation="1234567890"
  end

  test"user should be valid" do
    #puts "user should be valid #{@user.valid?}"
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email_id = "  "
    assert_not @user.valid?
  end

  test "check password should have more than 6 letter on update" do
    @user.password = "12345"
    @user.password_confirmation = "12345"
    assert_not @user.valid?
  end

  test "check password should have more than 6 letter on create" do
    user = User.create(name: "ABC", email_id: "ABC@123.com", password: "12345", password_confirmation: "12345")
    assert_not user.valid?
  end

  test "password and confirm password  should be same" do
    @user.password = "1234567890"
    @user.password_confirmation = "0123456789"
    assert_not @user.valid?
  end

end
