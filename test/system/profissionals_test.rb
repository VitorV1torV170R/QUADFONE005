require "application_system_test_case"

class ProfissionalsTest < ApplicationSystemTestCase
  setup do
    @profissional = profissionals(:one)
  end

  test "visiting the index" do
    visit profissionals_url
    assert_selector "h1", text: "Profissionals"
  end

  test "should create profissional" do
    visit profissionals_url
    click_on "New profissional"

    fill_in "Email", with: @profissional.email
    fill_in "Endereço", with: @profissional.endereço
    fill_in "Nome", with: @profissional.nome
    fill_in "Telefone", with: @profissional.telefone
    click_on "Create Profissional"

    assert_text "Profissional was successfully created"
    click_on "Back"
  end

  test "should update Profissional" do
    visit profissional_url(@profissional)
    click_on "Edit this profissional", match: :first

    fill_in "Email", with: @profissional.email
    fill_in "Endereço", with: @profissional.endereço
    fill_in "Nome", with: @profissional.nome
    fill_in "Telefone", with: @profissional.telefone
    click_on "Update Profissional"

    assert_text "Profissional was successfully updated"
    click_on "Back"
  end

  test "should destroy Profissional" do
    visit profissional_url(@profissional)
    click_on "Destroy this profissional", match: :first

    assert_text "Profissional was successfully destroyed"
  end
end
