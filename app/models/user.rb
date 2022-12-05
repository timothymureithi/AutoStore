class User < ApplicationRecord
    rolify 
    has_secure_password 
    has_many :products, :dependent => :destroy
    has_many :orders 
    has_many :order_items, through: :products
    has_many :reviews, dependent: :destroy
    has_one :cart, dependent: :destroy
    validates :first_name, :last_name, :username, :password, presence:true, on: :create
    validates_uniqueness_of :username, :email
end
