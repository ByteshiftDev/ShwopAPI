class Member < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :first_password, presence: true

  def add_key
    self.key = self.id
  end
  
end
