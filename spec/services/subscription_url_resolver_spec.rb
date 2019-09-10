require_relative '../test_helper'
require_relative '../../app/services/subscription_url_resolver'
require_relative '../../app/models/user'
require_relative '../../app/models/subscription'
require_relative 'subscription_url_resolver_helper'

describe SubscriptionUrlResolver do
  include SubscriptionUrlResolverHelper

  let(:user) { create(:user) }
  let(:request) { MiniTest::Mock.new }

  describe '#call' do
    describe 'a subscription exists' do
      before do
        create(:subscription, :not_active, user: user)
      end

      describe 'an active subscription exists' do
        it 'returns an active subscription url' do
          url_equal_test subscription_path(create(:subscription, :active, user: user))
        end
      end

      describe 'an active subscription does not exists' do
        it 'returns a paused subscription url' do
          url_equal_test subscription_path(create(:subscription, :paused, user: user))
        end
      end
    end

    describe 'there are no subscriptions' do
      it 'returns root url' do
        url_equal_test url_helpers.root_path
      end
    end
  end
end
