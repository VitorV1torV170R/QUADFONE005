require "application_system_test_case"

class AtendimentopalavrasTest < ApplicationSystemTestCase
  setup do
    @atendimentopalavra = atendimentopalavras(:one)
  end

  test "visiting the index" do
    visit atendimentopalavras_url
    assert_selector "h1", text: "Atendimentopalavras"
  end

  test "should create atendimentopalavra" do
    visit atendimentopalavras_url
    click_on "New atendimentopalavra"

    fill_in "Palavra", with: @atendimentopalavra.palavra
    fill_in "Transcricao", with: @atendimentopalavra.transcricao
    click_on "Create Atendimentopalavra"

    assert_text "Atendimentopalavra was successfully created"
    click_on "Back"
  end

  test "should update Atendimentopalavra" do
    visit atendimentopalavra_url(@atendimentopalavra)
    click_on "Edit this atendimentopalavra", match: :first

    fill_in "Palavra", with: @atendimentopalavra.palavra
    fill_in "Transcricao", with: @atendimentopalavra.transcricao
    click_on "Update Atendimentopalavra"

    assert_text "Atendimentopalavra was successfully updated"
    click_on "Back"
  end

  test "should destroy Atendimentopalavra" do
    visit atendimentopalavra_url(@atendimentopalavra)
    click_on "Destroy this atendimentopalavra", match: :first

    assert_text "Atendimentopalavra was successfully destroyed"
  end
end
