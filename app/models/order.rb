class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, paid_up: 1, making: 2, preparing: 3, shipped: 4 }

  with_options presence: true do
    validates :postal_code
    validates :address
    validates :name
    validates :payment_method
    validates :postage
    validates :total_payment
  end

  # validates :payment_method, inclusion: {in: [credit_card, transfer]}

  def full_address
    "〒" + postal_code + " " + address
  end


  # def total
  #   OrderDetail.all.sum(:price)
  #   # order_detail.price * 1.1.round * order_detail.amount
  # end

end
