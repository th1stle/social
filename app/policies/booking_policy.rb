class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  
  def show?
    scope.where(:id => booking.id).exists?
  end
  
  def create?
   user.present?
  end
  
  def new?
    create?
  end
  
  def update?
    user.present? && user == booking
  end
  
  def edit?
    update?
  end
  
  def destroy
  user.present? && user == booking
  end
  
  
  
  private
  
  def booking
    record
  end
end
