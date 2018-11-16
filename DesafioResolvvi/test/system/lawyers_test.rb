require "application_system_test_case"

class LawyersTest < ApplicationSystemTestCase
  setup do
    @lawyer = lawyers(:one)
  end

  test "visiting the index" do
    visit lawyers_url
    assert_selector "h1", text: "Lawyers"
  end

  test "creating a Lawyer" do
    visit lawyers_url
    click_on "New Lawyer"

    fill_in "Name", with: @lawyer.name
    fill_in "Order", with: @lawyer.order
    fill_in "State", with: @lawyer.state
    click_on "Create Lawyer"

    assert_text "Lawyer was successfully created"
    click_on "Back"
  end

  test "updating a Lawyer" do
    visit lawyers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @lawyer.name
    fill_in "Order", with: @lawyer.order
    fill_in "State", with: @lawyer.state
    click_on "Update Lawyer"

    assert_text "Lawyer was successfully updated"
    click_on "Back"
  end

  test "destroying a Lawyer" do
    visit lawyers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lawyer was successfully destroyed"
  end
end
