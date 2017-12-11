require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
    @client = clients(:one)
    @user = users(:michael)
    log_in_as(@user)
  end

  test "should get index" do
    get client_events_path(@client)
    assert_response :success
  end

  test "should get new" do
    get new_client_event_path(@client)
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post client_events_path(@client), params: { event: { billed: @event.billed, client_id: @event.client_id,
                                                           description: @event.description, end_time: @event.end_time,
                                                           start_time: @event.start_time, title: @event.title } }
    end
  end

  test "should show event" do
    get client_event_path(@client, @event)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_event_path(@client, @event)
    assert_response :success
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete client_event_path(@client, @event)
    end

    assert_redirected_to @client
  end
end
