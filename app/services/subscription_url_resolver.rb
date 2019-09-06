class SubscriptionUrlResolver
  def self.call(user, request)
    active_subscription = user.subscriptions.active.first || user.subscriptions.paused.first

    if active_subscription
      uri_string(:subscription_path, request, active_subscription)
    else
      url_string(:root_path)
    end
  end

  private

  def self.uri_string(path, request, *params)
    uri = URI(url_string(path, params))
    uri.query = request.query_string.presence
    uri.to_s
  end

  def self.url_string(path, *params)
    Rails.application.routes.url_helpers.send(path, params)
  end
end
