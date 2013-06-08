module UserSteps
  def create_user
    create_visitor
    delete_user
    @user = FactoryGirl.create(:user, email: @visitor[:email])
  end

  def create_visitor
    @visitor ||= { :name => "Testy McUserton", :email => "example@example.com",
                   :password => "changeme", :password_confirmation => "changeme" }
  end

  def delete_user
    @user ||= User.first conditions: {:email => @visitor[:email]}
    @user.destroy unless @user.nil?
  end

  step :create_visitor, "create visitor"
  step :delete_user, "delete user"
  step :create_user, "create user"
end

RSpec.configure { |c| c.include UserSteps }
