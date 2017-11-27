require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
    @user = users(:michael)
  end

  test "should get index" do
    log_in_as(@user)
    get clients_url
    assert_response :success
  end

  test "should get new" do
    log_in_as(@user)
    get new_client_url
    assert_response :success
  end

  test "should create client" do
    log_in_as(@user)
    assert_difference('Client.count') do
      post clients_url, params: { client: { email: @client.email, first_name: @client.first_name, last_name: @client.last_name, tariff: @client.tariff, user_id: @client.user_id } }
    end

    assert_redirected_to client_url(Client.last)
  end

  test "should show client" do
    log_in_as(@user)
    get client_url(@client)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_client_url(@client)
    assert_response :success
  end

  test "should update client" do
    log_in_as(@user)
    patch client_url(@client), params: { client: { email: @client.email, first_name: @client.first_name, last_name: @client.last_name, user_id: @client.user_id } }
    assert_redirected_to client_url(@client)
  end

  test "should destroy client" do
    log_in_as(@user)
    assert_difference('Client.count', -1) do
      delete client_url(@client)
    end

    assert_redirected_to clients_url
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Client.count' do
      post clients_path, params: { client: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Client.count' do
      delete client_path(@client)
    end
    assert_redirected_to login_url
  end
end
