require 'test_helper'

class PaginasEstaticasControllerTest < ActionController::TestCase
  test "should get sobre_nosotros" do
    get :sobre_nosotros
    assert_response :success
  end

end
