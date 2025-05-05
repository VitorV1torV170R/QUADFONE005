require "application_system_test_case"

class VocabulariopalavrasTest < ApplicationSystemTestCase
  setup do
    @vocabulariopalavra = vocabulariopalavras(:one)
  end

  test "visiting the index" do
    visit vocabulariopalavras_url
    assert_selector "h1", text: "Vocabulariopalavras"
  end

  test "should create vocabulariopalavra" do
    visit vocabulariopalavras_url
    click_on "New vocabulariopalavra"

    fill_in "Palavra", with: @vocabulariopalavra.palavra
    fill_in "Vocabulario", with: @vocabulariopalavra.vocabulario_id
    click_on "Create Vocabulariopalavra"

    assert_text "Vocabulariopalavra was successfully created"
    click_on "Back"
  end

  test "should update Vocabulariopalavra" do
    visit vocabulariopalavra_url(@vocabulariopalavra)
    click_on "Edit this vocabulariopalavra", match: :first

    fill_in "Palavra", with: @vocabulariopalavra.palavra
    fill_in "Vocabulario", with: @vocabulariopalavra.vocabulario_id
    click_on "Update Vocabulariopalavra"

    assert_text "Vocabulariopalavra was successfully updated"
    click_on "Back"
  end

  test "should destroy Vocabulariopalavra" do
    visit vocabulariopalavra_url(@vocabulariopalavra)
    click_on "Destroy this vocabulariopalavra", match: :first

    assert_text "Vocabulariopalavra was successfully destroyed"
  end
end
