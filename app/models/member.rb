# -*- encoding : utf-8 -*-
class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :address, :city, :postcode,:country, :email, :password, :password_confirmation, :remember_me

  validates :name,:email,:password, :password_confirmation,  :country, :city, :presence => true
  #validates :postcode, :presence => true, :numericality => true


  def self.mass_invite(email_name_string)
    email_name_string.lines.reduce([]) do |members, line|
      email, name = line.split(',')
      members << {email: email.chomp, name: name.gsub('"','').chomp}
    end
  end

  def self.mass_invite!(email_name_string)
    mass_invite(email_name_string).each do |m|
      Member.invite!(m)
    end.count
  end
end
