require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get legislation" do
    get pages_legislation_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end

  test "should get qui-sommes-nous" do
    get pages_qui-sommes-nous_url
    assert_response :success
  end

end
