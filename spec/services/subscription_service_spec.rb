require_relative '../test_helper'
require_relative '../../app/services/subscription_service'
require_relative '../../app/models/user'
require_relative '../../app/models/subscription'

describe SubscriptionService do
  let(:user) { User.new }
  let(:subscription) { Subscription.create(user_id: user, active: true) }
  let(:subscription_service) { SubscriptionService.new(user) }

  describe '#subscription' do
    it 'returns an active subscription if it exists' do
      assert_eql subscription_service.subscription, subscription
    end

    it 'returns a paused subscription if active one is not exists' do
      subscription.update(active: false)
      assert_eql subscription_service.subscription(user), subscription
    end
  end
end
