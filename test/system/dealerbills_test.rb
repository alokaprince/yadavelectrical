require "application_system_test_case"

class DealerbillsTest < ApplicationSystemTestCase
  setup do
    @dealerbill = dealerbills(:one)
  end

  test "visiting the index" do
    visit dealerbills_url
    assert_selector "h1", text: "Dealerbills"
  end

  test "creating a Dealerbill" do
    visit dealerbills_url
    click_on "New Dealerbill"

    fill_in "Billno", with: @dealerbill.billno
    fill_in "Credit", with: @dealerbill.credit
    fill_in "Date", with: @dealerbill.date
    fill_in "Dealer", with: @dealerbill.dealer_id
    fill_in "Debit", with: @dealerbill.debit
    fill_in "Remark", with: @dealerbill.remark
    click_on "Create Dealerbill"

    assert_text "Dealerbill was successfully created"
    click_on "Back"
  end

  test "updating a Dealerbill" do
    visit dealerbills_url
    click_on "Edit", match: :first

    fill_in "Billno", with: @dealerbill.billno
    fill_in "Credit", with: @dealerbill.credit
    fill_in "Date", with: @dealerbill.date
    fill_in "Dealer", with: @dealerbill.dealer_id
    fill_in "Debit", with: @dealerbill.debit
    fill_in "Remark", with: @dealerbill.remark
    click_on "Update Dealerbill"

    assert_text "Dealerbill was successfully updated"
    click_on "Back"
  end

  test "destroying a Dealerbill" do
    visit dealerbills_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dealerbill was successfully destroyed"
  end
end
