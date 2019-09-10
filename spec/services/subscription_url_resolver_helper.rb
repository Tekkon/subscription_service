module SubscriptionUrlResolverHelper
  def url_equal_test(expected_url)
    set_expectations
    assert_equal SubscriptionUrlResolver.call(user, request), expected_url
  end

  def subscription_path(subscription)
    set_expectations
    "#{URI(url_helpers.subscription_path(subscription)).to_s}?#{request.query_string}"
  end

  def url_helpers
    Rails.application.routes.url_helpers
  end

  private

  def set_expectations
    request.expect :query_string, "param1=1"
  end
end
