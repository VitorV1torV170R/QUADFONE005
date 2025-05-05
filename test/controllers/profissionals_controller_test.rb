require "test_helper"

class ProfissionalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profissional = profissionals(:one)
  end

  test "should get index" do
    get profissionals_url
    assert_response :success
  end

  test "should get new" do
    get new_profissional_url
    assert_response :success
  end

  test "should create profissional" do
    assert_difference("Profissional.count") do
      post profissionals_url, params: { profissional: { email: @profissional.email, endereço: @profissional.endereço, nome: @profissional.nome, telefone: @profissional.telefone } }
    end

    assert_redirected_to profissional_url(Profissional.last)
  end

  test "should show profissional" do
    get profissional_url(@profissional)
    assert_response :success
  end

  test "should get edit" do
    get edit_profissional_url(@profissional)
    assert_response :success
  end

  test "should update profissional" do
    patch profissional_url(@profissional), params: { profissional: { email: @profissional.email, endereço: @profissional.endereço, nome: @profissional.nome, telefone: @profissional.telefone } }
    assert_redirected_to profissional_url(@profissional)
  end

  test "should destroy profissional" do
    assert_difference("Profissional.count", -1) do
      delete profissional_url(@profissional)
    end

    assert_redirected_to profissionals_url
  end
end
