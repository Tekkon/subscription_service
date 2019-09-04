class SubscriptionService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def subscription
    user.subscriptions.active.first || user.subscriptions.paused.first
  end
end
