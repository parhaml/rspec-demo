class User < ApplicationRecord
  has_many :addresses

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
