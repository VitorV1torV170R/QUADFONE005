require "test_helper"

class AtendimentopalavrasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atendimentopalavra = atendimentopalavras(:one)
  end

  test "should get index" do
    get atendimentopalavras_url
    assert_response :success
  end

  test "should get new" do
    get new_atendimentopalavra_url
    assert_response :success
  end

  test "should create atendimentopalavra" do
    assert_difference("Atendimentopalavra.count") do
      post atendimentopalavras_url, params: { atendimentopalavra: { palavra: @atendimentopalavra.palavra, transcricao: @atendimentopalavra.transcricao } }
    end

    assert_redirected_to atendimentopalavra_url(Atendimentopalavra.last)
  end

  test "should show atendimentopalavra" do
    get atendimentopalavra_url(@atendimentopalavra)
    assert_response :success
  end

  test "should get edit" do
    get edit_atendimentopalavra_url(@atendimentopalavra)
    assert_response :success
  end

  test "should update atendimentopalavra" do
    patch atendimentopalavra_url(@atendimentopalavra), params: { atendimentopalavra: { palavra: @atendimentopalavra.palavra, transcricao: @atendimentopalavra.transcricao } }
    assert_redirected_to atendimentopalavra_url(@atendimentopalavra)
  end

  test "should destroy atendimentopalavra" do
    assert_difference("Atendimentopalavra.count", -1) do
      delete atendimentopalavra_url(@atendimentopalavra)
    end

    assert_redirected_to atendimentopalavras_url
  end
end
