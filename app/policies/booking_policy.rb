class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    user_is_client_or_owner?
  end

  def create?
    true
  end

  private
  def user_is_client_or_owner?
    record.user == user || record.boat.user == user
  end

end
