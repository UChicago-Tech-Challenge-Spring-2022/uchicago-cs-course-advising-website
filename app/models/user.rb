class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_plans

  def create_plans
    plans = Plan.new
    plans.user_id = self.id
    plans.save
  end  


  def plans
    return  Plan.where({:user_id => self.id}).first
  end
end
