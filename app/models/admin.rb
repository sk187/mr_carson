class Admin < ActiveRecord::Base
    attr_accessor :password
    validates_confirmation_of :password
    validates_presence_of :username, :password
    validates :username, uniqueness: true
    before_save :encrypt_password
    def encrypt_password
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end

    def self.authenticate(username, password)
        admin = Admin.find_by(username: username)
        if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
            admin
        else
            nil
        end
    end
end
