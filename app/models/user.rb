class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :complaints

  validates :ic_number, format: { with: /\A[\d]{6}-[\d]{2}-[\d]{4}\z/, message: "can only be integers. No letters/signs allowed." }
  validates :driving_license, format: { with: /\A[\d]{8}\z/, message: "can only be integers. No letters/signs allowed." }
  validates :number_plate, format: { with: /\A[A-Z]{3}\s[\d]{4}\z/, message: "a in invalid format. "}
end
