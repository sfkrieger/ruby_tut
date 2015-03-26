require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Some name", email: "some@email.com",
    password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end


  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "emails should be valid if they have the correct @ and . structure" do
    valid_addresses = %w[sam@gmail.com k@m.com b@edu.org lk@bu.ec.edy]
    valid_addresses.each do |email|
      @user.email = email
      assert @user.valid?, "#{valid_addresses.inspect} should be valid"
    end
  end

  test "emails shouldn't be valid" do
    invalid_emails = %w[sk po@ kd.k po@. kd.d @. @k.c]
    invalid_emails.each do |invalid_e|
      @user.email = invalid_e
      assert_not @user.valid?, "The email #{@user.email} shouldn't be valid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
