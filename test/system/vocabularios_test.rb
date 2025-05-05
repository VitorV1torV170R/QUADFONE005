require "application_system_test_case"

class VocabulariosTest < ApplicationSystemTestCase
  setup do
    @vocabulario = vocabularios(:one)
  end

  test "visiting the index" do
    visit vocabularios_url
    assert_selector "h1", text: "Vocabularios"
  end

  test "should create vocabulario" do
    visit vocabularios_url
    click_on "New vocabulario"

    fill_in "Nome", with: @vocabulario.nome
    click_on "Create Vocabulario"

    assert_text "Vocabulario was successfully created"
    click_on "Back"
  end

  test "should update Vocabulario" do
    visit vocabulario_url(@vocabulario)
    click_on "Edit this vocabulario", match: :first

    fill_in "Nome", with: @vocabulario.nome
    click_on "Update Vocabulario"

    assert_text "Vocabulario was successfully updated"
    click_on "Back"
  end

  test "should destroy Vocabulario" do
    visit vocabulario_url(@vocabulario)
    click_on "Destroy this vocabulario", match: :first

    assert_text "Vocabulario was successfully destroyed"
  end
end
