require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get booking:references" do
    get reviews_booking:references_url
    assert_response :success
  end

end
