require "application_system_test_case"

class MakersTest < ApplicationSystemTestCase
  setup do
    @maker = makers(:one)
  end

  test "visiting the index" do
    visit makers_url
    assert_selector "h1", text: "Makers"
  end

  test "should create maker" do
    visit makers_url
    click_on "New maker"

    fill_in "Name", with: @maker.name
    click_on "Create Maker"

    assert_text "Maker was successfully created"
    click_on "Back"
  end

  test "should update Maker" do
    visit maker_url(@maker)
    click_on "Edit this maker", match: :first

    fill_in "Name", with: @maker.name
    click_on "Update Maker"

    assert_text "Maker was successfully updated"
    click_on "Back"
  end

  test "should destroy Maker" do
    visit maker_url(@maker)
    click_on "Destroy this maker", match: :first

    assert_text "Maker was successfully destroyed"
  end
end
