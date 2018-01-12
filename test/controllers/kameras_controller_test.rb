require 'test_helper'

class KamerasControllerTest < ActionDispatch::IntegrationTest
  test "should get kolekcija" do
    get kameras_kolekcija_url
    assert_response :success
  end

  test "should get pievienot" do
    get kameras_pievienot_url
    assert_response :success
  end

  test "should get kopsavilkums" do
    get kameras_kopsavilkums_url
    assert_response :success
  end

end
