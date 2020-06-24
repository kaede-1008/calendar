class User < ActivwRecord:Base
    has_secure_password
    has_many :articles

    validates :username, presence:true, uniqueness: true
end