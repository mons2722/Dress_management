require "application_system_test_case"

class ClothesTest < ApplicationSystemTestCase
  setup do
    @clothe = clothes(:one)
  end

  test "visiting the index" do
    visit clothes_url
    assert_selector "h1", text: "Clothes"
  end

  test "should create clothe" do
    visit clothes_url
    click_on "New clothe"

    fill_in "Category", with: @clothe.category_id
    fill_in "Color", with: @clothe.color
    fill_in "Material", with: @clothe.material
    fill_in "Name", with: @clothe.name
    fill_in "Price", with: @clothe.price
    fill_in "Size", with: @clothe.size
    fill_in "Stock", with: @clothe.stock
    click_on "Create Clothe"

    assert_text "Clothe was successfully created"
    click_on "Back"
  end

  test "should update Clothe" do
    visit clothe_url(@clothe)
    click_on "Edit this clothe", match: :first

    fill_in "Category", with: @clothe.category_id
    fill_in "Color", with: @clothe.color
    fill_in "Material", with: @clothe.material
    fill_in "Name", with: @clothe.name
    fill_in "Price", with: @clothe.price
    fill_in "Size", with: @clothe.size
    fill_in "Stock", with: @clothe.stock
    click_on "Update Clothe"

    assert_text "Clothe was successfully updated"
    click_on "Back"
  end

  test "should destroy Clothe" do
    visit clothe_url(@clothe)
    click_on "Destroy this clothe", match: :first

    assert_text "Clothe was successfully destroyed"
  end
end
