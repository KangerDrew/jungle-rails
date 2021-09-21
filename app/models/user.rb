class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    # .strip is to ensure that any leading or trailing space will be ignored
    user = self.find_by_email(email.strip)
    
    if user && user.authenticate(password)
      return user
    else
      return nil
    end

  end

end
