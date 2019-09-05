require_relative '../test_helper'
require_relative '../../app/services/subscription_url_resolver'
require_relative '../../app/models/user'
require_relative '../../app/models/subscription'

describe SubscriptionUrlResolver do
  let(:user) { User.create(name: 'User', email: 'user@gmail.com') }
  let(:request) { MiniTest::Mock.new }
  let(:subscription_url_resolver) { SubscriptionUrlResolver.new(user, request) }

  before do
    4.times do
      request.expect :query_string, "param1=1"
    end
  end

  describe '#call' do
    it 'returns an active subscription url if it exists' do
      subscription = Subscription.create(user_id: user.id, active: true)
      Subscription.create(user_id: user.id, active: false)
      assert_equal subscription_url_resolver.call, "#{URI(Rails.application.routes.url_helpers.subscription_path(subscription)).to_s}?#{request.query_string}"
    end

    it 'returns a paused subscription url if active one is not exists' do
      subscription = Subscription.create(user_id: user.id, active: false, paused: true)
      Subscription.create(user_id: user.id, active: false)
      assert_equal subscription_url_resolver.call, "#{URI(Rails.application.routes.url_helpers.subscription_path(subscription)).to_s}?#{request.query_string}"
    end

    it 'returns root url if there are no subscriptions' do
      assert_equal subscription_url_resolver.call, Rails.application.routes.url_helpers.root_path
    end
  end
end
