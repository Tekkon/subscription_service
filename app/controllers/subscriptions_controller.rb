class SubscriptionsController < ApplicationController
  def index
    subscription = SubscriptionSearcher.new(user).call

    if subscription
      uri = URI(subscription_path(subscription))
      uri.query = request.query_string.presence

      redirect_to uri.to_s
    else
      redirect_to root_path
    end
  end
end
