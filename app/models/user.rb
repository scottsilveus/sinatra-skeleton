class User < ActiveRecord::Base
	include BCrypt

	validates :name, presence: true, uniqueness: true
	validates :email, presence: true, format: {with: /.*[@].*[.].*/ }
	validates :password_hash, presence: true

	def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, user_password)
    user = self.find_by_username(username)
    if user && (user.password == user_password)
      user
    else
      nil
    end
  end
  
end
