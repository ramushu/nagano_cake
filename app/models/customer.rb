class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :postal_code
    validates :address
    validates :telephone_number
  end

  with_options uniqueness: true do
    validates :telephone_number
  end

  with_options on: :create? do
    validates :password, length: {minimum: 6}
    validates :password, presence: true
  end

  validates :is_deleted, inclusion: {in: [true, false]}


  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end


end
