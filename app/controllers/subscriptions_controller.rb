class SubscriptionsController < ApplicationController
  def index
    redirect_to SubscriptionUrlResolver.new(user, request).call
  end
end
