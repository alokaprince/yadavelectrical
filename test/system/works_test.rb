require "application_system_test_case"

class WorksTest < ApplicationSystemTestCase
  setup do
    @work = works(:one)
  end

  test "visiting the index" do
    visit works_url
    assert_selector "h1", text: "Works"
  end

  test "creating a Work" do
    visit works_url
    click_on "New Work"

    fill_in "Hp", with: @work.HP
    fill_in "Amount", with: @work.amount
    fill_in "Coil", with: @work.coil
    fill_in "Company", with: @work.company
    fill_in "Connection", with: @work.connection
    fill_in "Gauge", with: @work.gauge
    fill_in "Length", with: @work.length
    fill_in "Model", with: @work.model
    fill_in "Name", with: @work.name
    fill_in "Pitch1", with: @work.pitch1
    fill_in "Pitch2", with: @work.pitch2
    fill_in "Remark", with: @work.remark
    fill_in "Slot", with: @work.slot
    fill_in "Stetarlen", with: @work.stetarlen
    fill_in "Turn1", with: @work.turn1
    fill_in "Turn2", with: @work.turn2
    fill_in "Weight", with: @work.weight
    click_on "Create Work"

    assert_text "Work was successfully created"
    click_on "Back"
  end

  test "updating a Work" do
    visit works_url
    click_on "Edit", match: :first

    fill_in "Hp", with: @work.HP
    fill_in "Amount", with: @work.amount
    fill_in "Coil", with: @work.coil
    fill_in "Company", with: @work.company
    fill_in "Connection", with: @work.connection
    fill_in "Gauge", with: @work.gauge
    fill_in "Length", with: @work.length
    fill_in "Model", with: @work.model
    fill_in "Name", with: @work.name
    fill_in "Pitch1", with: @work.pitch1
    fill_in "Pitch2", with: @work.pitch2
    fill_in "Remark", with: @work.remark
    fill_in "Slot", with: @work.slot
    fill_in "Stetarlen", with: @work.stetarlen
    fill_in "Turn1", with: @work.turn1
    fill_in "Turn2", with: @work.turn2
    fill_in "Weight", with: @work.weight
    click_on "Update Work"

    assert_text "Work was successfully updated"
    click_on "Back"
  end

  test "destroying a Work" do
    visit works_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work was successfully destroyed"
  end
end
