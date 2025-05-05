require "test_helper"

class VocabulariopalavrasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vocabulariopalavra = vocabulariopalavras(:one)
  end

  test "should get index" do
    get vocabulariopalavras_url
    assert_response :success
  end

  test "should get new" do
    get new_vocabulariopalavra_url
    assert_response :success
  end

  test "should create vocabulariopalavra" do
    assert_difference("Vocabulariopalavra.count") do
      post vocabulariopalavras_url, params: { vocabulariopalavra: { palavra: @vocabulariopalavra.palavra, vocabulario_id: @vocabulariopalavra.vocabulario_id } }
    end

    assert_redirected_to vocabulariopalavra_url(Vocabulariopalavra.last)
  end

  test "should show vocabulariopalavra" do
    get vocabulariopalavra_url(@vocabulariopalavra)
    assert_response :success
  end

  test "should get edit" do
    get edit_vocabulariopalavra_url(@vocabulariopalavra)
    assert_response :success
  end

  test "should update vocabulariopalavra" do
    patch vocabulariopalavra_url(@vocabulariopalavra), params: { vocabulariopalavra: { palavra: @vocabulariopalavra.palavra, vocabulario_id: @vocabulariopalavra.vocabulario_id } }
    assert_redirected_to vocabulariopalavra_url(@vocabulariopalavra)
  end

  test "should destroy vocabulariopalavra" do
    assert_difference("Vocabulariopalavra.count", -1) do
      delete vocabulariopalavra_url(@vocabulariopalavra)
    end

    assert_redirected_to vocabulariopalavras_url
  end
end
