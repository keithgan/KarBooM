class Officer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  paginates_per 50
  enum role: {officer: 0, superadmin: 1}
  has_many :fines
  validates :officer_locality, format: { with: /\A\d{5}\z/ }
end
