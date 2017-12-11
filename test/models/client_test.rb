require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @client = @user.clients.build(first_name: "Mario", last_name: "Rossi", email:"mario.rossi@example.com", tariff: 10,
                                  fiscal_code: "0123456789AQWEDS",
                                  address: "Address",
                                  city: "City",
                                  district: "District",
                                  postal_code: "Postal Code",
                                  phone: "Phone")
  end

  test "should be valid" do
    assert @client.valid?
  end

  test "user id should be present" do
    @client.user_id = nil
    assert_not @client.valid?
  end

  test "first name should be present" do
    @client.first_name = ""
    assert_not @client.valid?
  end

  test "last name should be present" do
    @client.last_name = ""
    assert_not @client.valid?
  end

  test "email should be present" do
    @client.email = ""
    assert_not @client.valid?
  end

  test "first name should not be too long" do
    @client.first_name = "a" * 51
    assert_not @client.valid?
  end

  test "last name should not be too long" do
    @client.last_name = "a" * 51
    assert_not @client.valid?
  end

  test "email should not be too long" do
    @client.email = "a" * 244 + "@example.com"
    assert_not @client.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[client@example,com client_at_foo.org client.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @client.email = invalid_address
      assert_not @client.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
