require 'test_helper'

class DealerbillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dealerbill = dealerbills(:one)
  end

  test "should get index" do
    get dealerbills_url
    assert_response :success
  end

  test "should get new" do
    get new_dealerbill_url
    assert_response :success
  end

  test "should create dealerbill" do
    assert_difference('Dealerbill.count') do
      post dealerbills_url, params: { dealerbill: { billno: @dealerbill.billno, credit: @dealerbill.credit, date: @dealerbill.date, dealer_id: @dealerbill.dealer_id, debit: @dealerbill.debit, remark: @dealerbill.remark } }
    end

    assert_redirected_to dealerbill_url(Dealerbill.last)
  end

  test "should show dealerbill" do
    get dealerbill_url(@dealerbill)
    assert_response :success
  end

  test "should get edit" do
    get edit_dealerbill_url(@dealerbill)
    assert_response :success
  end

  test "should update dealerbill" do
    patch dealerbill_url(@dealerbill), params: { dealerbill: { billno: @dealerbill.billno, credit: @dealerbill.credit, date: @dealerbill.date, dealer_id: @dealerbill.dealer_id, debit: @dealerbill.debit, remark: @dealerbill.remark } }
    assert_redirected_to dealerbill_url(@dealerbill)
  end

  test "should destroy dealerbill" do
    assert_difference('Dealerbill.count', -1) do
      delete dealerbill_url(@dealerbill)
    end

    assert_redirected_to dealerbills_url
  end
end
