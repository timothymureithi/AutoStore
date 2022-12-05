class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar, :first_name, :last_name, :email
  has_many :roles
  has_one :cart
end
