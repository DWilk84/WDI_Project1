class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    elsif user.role? :program_manager
      can :manage, Program
      can :manage, Course
      can :read, Classroom
      can :update, Classroom
      can :create, Admission
      can :read, Admission
      can :update, Admission
      can :read, User, id: user.id 
      can :update, User, id: user.id 
    elsif user.role? :instructor
      can :read, Program
      can :read, Course
      can :read, Classroom
      can :read, User, id: user.id 
      can :update, User, id: user.id 
    elsif user.role? :customer
      can :read, Program
      can :read, Course
      can :create, Admission
      can :read, User, id: user.id
      can :update, User, id: user.id
    else
      can :read, Course
      can :read, Program
      can :create, User
    end
  end
end
