require_relative '../test_helper'
require_relative '../../app/services/subscription_searcher'
require_relative '../../app/models/user'
require_relative '../../app/models/subscription'

describe SubscriptionSearcher do
  let(:user) { User.create(name: 'User', email: 'user@gmail.com') }
  let(:subscription_searcher) { SubscriptionSearcher.new(user) }

  describe '#call' do
    it 'returns an active subscription if it exists' do
      subscription = Subscription.create(user_id: user.id, active: true)
      Subscription.create(user_id: user.id, active: false)
      assert_equal subscription_searcher.call, subscription
    end

    it 'returns a paused subscription if active one is not exists' do
      subscription = Subscription.create(user_id: user.id, active: false, paused: true)
      Subscription.create(user_id: user.id, active: false)
      assert_equal subscription_searcher.call, subscription
    end
  end
end
