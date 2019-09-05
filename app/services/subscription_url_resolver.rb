class SubscriptionUrlResolver
  attr_reader :user, :request

  def initialize(user, request)
    @user = user
    @request = request
  end

  def call
    subscription = user.subscriptions.active.first || user.subscriptions.paused.first

    if subscription
      uri = URI(Rails.application.routes.url_helpers.subscription_path(subscription))
      uri.query = request.query_string.presence
      uri.to_s
    else
      Rails.application.routes.url_helpers.root_path
    end
  end
end
