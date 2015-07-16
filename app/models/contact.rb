class Contact < ActiveRecord::Base
    validates :name, presence: true
    validates :email, presence: true # it makes sure that there is somthign was written in the field and its not embty
    
    
end