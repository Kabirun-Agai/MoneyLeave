require 'test_helper'

class MoneyMControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get money_m_index_url
    assert_response :success
  end

end
