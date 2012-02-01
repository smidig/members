class Member < ActiveRecord::Base
	validates :name, :address, :postcode, :city, :presence => true
	validates :postcode, :presence => true, :numericality => true

	validates :email, :presence => true, 
                      :length => {:minimum => 3, :maximum => 254},
                      :uniqueness => true,
                      :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  
end
