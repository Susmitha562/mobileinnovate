class Imaginnovate< ActiveRecord::Base
	acts_as_paranoid column: :deleted_at
	belongs_to :user

    validates :first_name, presence: { message: "must be given please" }
    validates :last_name, presence: { message: "must be given please" }
    validates :email, presence: true
    
end
