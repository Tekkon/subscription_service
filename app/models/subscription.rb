class Subscription < ActiveRecord::Base
  belongs_to :user

  scope :active, -> { where(active: true) }
  scope :paused, -> { where(paused: true) }
end
