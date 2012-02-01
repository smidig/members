# -*- encoding : utf-8 -*-
class Member < ActiveRecord::Base
	validates :name, :address, :city, :presence => true
	validates :postcode, :presence => true, :numericality => true

	validates :email, :presence => true, 
                      :length => {:minimum => 3, :maximum => 254},
                      :uniqueness => true
  
end
