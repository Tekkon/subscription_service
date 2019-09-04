class SubscriptionsController < ApplicationController
  def index
    subscription = user.subscriptions.active.first || user.subscriptions.paused.first
    if subscription
      uri = URI(subscription_path(subscription))
      uri.query = request.query_string.presence

      redirect_to uri.to_s
    else
      redirect_to root_path
    end
  end
end
