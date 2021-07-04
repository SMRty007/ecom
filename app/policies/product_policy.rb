class ProductPolicy < ApplicationPolicy

    def new?
      user.seller?
    end
    def create?
      user.seller?
    end
    def update?
      user.seller?
    end
    def edit?
      user.seller?
    end
    def destroy?
      user.seller?
    end
  end
  