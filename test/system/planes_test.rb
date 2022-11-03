require "application_system_test_case"

class PlanesTest < ApplicationSystemTestCase
  setup do
    @plane = planes(:one)
  end

  test "visiting the index" do
    visit planes_url
    assert_selector "h1", text: "Planes"
  end

  test "creating a Plane" do
    visit planes_url
    click_on "New Plane"

    fill_in "Icao24", with: @plane.icao24
    check "Visible" if @plane.visible
    click_on "Create Plane"

    assert_text "Plane was successfully created"
    click_on "Back"
  end

  test "updating a Plane" do
    visit planes_url
    click_on "Edit", match: :first

    fill_in "Icao24", with: @plane.icao24
    check "Visible" if @plane.visible
    click_on "Update Plane"

    assert_text "Plane was successfully updated"
    click_on "Back"
  end

  test "destroying a Plane" do
    visit planes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plane was successfully destroyed"
  end
end
