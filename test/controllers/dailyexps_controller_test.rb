require 'test_helper'

class DailyexpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dailyexp = dailyexps(:one)
  end

  test "should get index" do
    get dailyexps_url
    assert_response :success
  end

  test "should get new" do
    get new_dailyexp_url
    assert_response :success
  end

  test "should create dailyexp" do
    assert_difference('Dailyexp.count') do
      post dailyexps_url, params: { dailyexp: { amount: @dailyexp.amount, name: @dailyexp.name, remark: @dailyexp.remark } }
    end

    assert_redirected_to dailyexp_url(Dailyexp.last)
  end

  test "should show dailyexp" do
    get dailyexp_url(@dailyexp)
    assert_response :success
  end

  test "should get edit" do
    get edit_dailyexp_url(@dailyexp)
    assert_response :success
  end

  test "should update dailyexp" do
    patch dailyexp_url(@dailyexp), params: { dailyexp: { amount: @dailyexp.amount, name: @dailyexp.name, remark: @dailyexp.remark } }
    assert_redirected_to dailyexp_url(@dailyexp)
  end

  test "should destroy dailyexp" do
    assert_difference('Dailyexp.count', -1) do
      delete dailyexp_url(@dailyexp)
    end

    assert_redirected_to dailyexps_url
  end
end
