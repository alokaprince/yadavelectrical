require "application_system_test_case"

class DealeritemsTest < ApplicationSystemTestCase
  setup do
    @dealeritem = dealeritems(:one)
  end

  test "visiting the index" do
    visit dealeritems_url
    assert_selector "h1", text: "Dealeritems"
  end

  test "creating a Dealeritem" do
    visit dealeritems_url
    click_on "New Dealeritem"

    fill_in "Amount", with: @dealeritem.amount
    fill_in "Dealerbill", with: @dealeritem.dealerbill_id
    fill_in "Itemname", with: @dealeritem.itemname
    fill_in "Quantity", with: @dealeritem.quantity
    fill_in "Rate", with: @dealeritem.rate
    fill_in "Unit", with: @dealeritem.unit
    click_on "Create Dealeritem"

    assert_text "Dealeritem was successfully created"
    click_on "Back"
  end

  test "updating a Dealeritem" do
    visit dealeritems_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @dealeritem.amount
    fill_in "Dealerbill", with: @dealeritem.dealerbill_id
    fill_in "Itemname", with: @dealeritem.itemname
    fill_in "Quantity", with: @dealeritem.quantity
    fill_in "Rate", with: @dealeritem.rate
    fill_in "Unit", with: @dealeritem.unit
    click_on "Update Dealeritem"

    assert_text "Dealeritem was successfully updated"
    click_on "Back"
  end

  test "destroying a Dealeritem" do
    visit dealeritems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dealeritem was successfully destroyed"
  end
end
