require "application_system_test_case"

class FlightsTest < ApplicationSystemTestCase
  setup do
    @flight = flights(:one)
  end

  test "visiting the index" do
    visit flights_url
    assert_selector "h1", text: "Flights"
  end

  test "creating a Flight" do
    visit flights_url
    click_on "New Flight"

    fill_in "Callsign", with: @flight.callsign
    fill_in "Estarrivalairport", with: @flight.estArrivalAirport
    fill_in "Estdepartureairport", with: @flight.estDepartureAirport
    fill_in "Firstseen", with: @flight.firstSeen
    fill_in "Lastseen", with: @flight.lastSeen
    click_on "Create Flight"

    assert_text "Flight was successfully created"
    click_on "Back"
  end

  test "updating a Flight" do
    visit flights_url
    click_on "Edit", match: :first

    fill_in "Callsign", with: @flight.callsign
    fill_in "Estarrivalairport", with: @flight.estArrivalAirport
    fill_in "Estdepartureairport", with: @flight.estDepartureAirport
    fill_in "Firstseen", with: @flight.firstSeen
    fill_in "Lastseen", with: @flight.lastSeen
    click_on "Update Flight"

    assert_text "Flight was successfully updated"
    click_on "Back"
  end

  test "destroying a Flight" do
    visit flights_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Flight was successfully destroyed"
  end
end
