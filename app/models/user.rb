class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile,
          inverse_of: :user,
          dependent: :destroy,
          class_name: 'Users::Profile'

  accepts_nested_attributes_for :profile
end
