require "application_system_test_case"

class DailyexpsTest < ApplicationSystemTestCase
  setup do
    @dailyexp = dailyexps(:one)
  end

  test "visiting the index" do
    visit dailyexps_url
    assert_selector "h1", text: "Dailyexps"
  end

  test "creating a Dailyexp" do
    visit dailyexps_url
    click_on "New Dailyexp"

    fill_in "Amount", with: @dailyexp.amount
    fill_in "Name", with: @dailyexp.name
    fill_in "Remark", with: @dailyexp.remark
    click_on "Create Dailyexp"

    assert_text "Dailyexp was successfully created"
    click_on "Back"
  end

  test "updating a Dailyexp" do
    visit dailyexps_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @dailyexp.amount
    fill_in "Name", with: @dailyexp.name
    fill_in "Remark", with: @dailyexp.remark
    click_on "Update Dailyexp"

    assert_text "Dailyexp was successfully updated"
    click_on "Back"
  end

  test "destroying a Dailyexp" do
    visit dailyexps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dailyexp was successfully destroyed"
  end
end
