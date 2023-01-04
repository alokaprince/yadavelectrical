require 'test_helper'

class DealeritemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dealeritem = dealeritems(:one)
  end

  test "should get index" do
    get dealeritems_url
    assert_response :success
  end

  test "should get new" do
    get new_dealeritem_url
    assert_response :success
  end

  test "should create dealeritem" do
    assert_difference('Dealeritem.count') do
      post dealeritems_url, params: { dealeritem: { amount: @dealeritem.amount, dealerbill_id: @dealeritem.dealerbill_id, itemname: @dealeritem.itemname, quantity: @dealeritem.quantity, rate: @dealeritem.rate, unit: @dealeritem.unit } }
    end

    assert_redirected_to dealeritem_url(Dealeritem.last)
  end

  test "should show dealeritem" do
    get dealeritem_url(@dealeritem)
    assert_response :success
  end

  test "should get edit" do
    get edit_dealeritem_url(@dealeritem)
    assert_response :success
  end

  test "should update dealeritem" do
    patch dealeritem_url(@dealeritem), params: { dealeritem: { amount: @dealeritem.amount, dealerbill_id: @dealeritem.dealerbill_id, itemname: @dealeritem.itemname, quantity: @dealeritem.quantity, rate: @dealeritem.rate, unit: @dealeritem.unit } }
    assert_redirected_to dealeritem_url(@dealeritem)
  end

  test "should destroy dealeritem" do
    assert_difference('Dealeritem.count', -1) do
      delete dealeritem_url(@dealeritem)
    end

    assert_redirected_to dealeritems_url
  end
end
