require 'test_helper'

class WalkthroughTest < ActionController::IntegrationTest

  should "get homepage" do
    visit '/'
    assert_equal '/', page.current_path
  end

end
