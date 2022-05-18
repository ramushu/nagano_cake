class Address < ApplicationRecord
  belongs_to :customer

  with_options presence: true do
    validates :postal_code
    validates :address
    validates :name
  end

  validates :postal_code,
    length: { minimum: 7, maximum: 7 }

end
