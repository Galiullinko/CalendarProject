class SubscriptionPolicy < ApplicationPolicy
  def subscribed?
    Subscription.find_by(user: @user)
  end
end
