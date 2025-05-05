require "test_helper"

class VocabulariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vocabulario = vocabularios(:one)
  end

  test "should get index" do
    get vocabularios_url
    assert_response :success
  end

  test "should get new" do
    get new_vocabulario_url
    assert_response :success
  end

  test "should create vocabulario" do
    assert_difference("Vocabulario.count") do
      post vocabularios_url, params: { vocabulario: { nome: @vocabulario.nome } }
    end

    assert_redirected_to vocabulario_url(Vocabulario.last)
  end

  test "should show vocabulario" do
    get vocabulario_url(@vocabulario)
    assert_response :success
  end

  test "should get edit" do
    get edit_vocabulario_url(@vocabulario)
    assert_response :success
  end

  test "should update vocabulario" do
    patch vocabulario_url(@vocabulario), params: { vocabulario: { nome: @vocabulario.nome } }
    assert_redirected_to vocabulario_url(@vocabulario)
  end

  test "should destroy vocabulario" do
    assert_difference("Vocabulario.count", -1) do
      delete vocabulario_url(@vocabulario)
    end

    assert_redirected_to vocabularios_url
  end
end
