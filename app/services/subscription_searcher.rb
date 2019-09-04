class SubscriptionSearcher
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    user.subscriptions.active.first || user.subscriptions.paused.first
  end
end
