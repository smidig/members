# -*- encoding : utf-8 -*-
class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :participate, :name, :address, :city, :postcode,:country, :email, :password, :password_confirmation, :remember_me

  validates :name,:email, :country, :city, :presence => true
  #validates :postcode, :presence => true, :numericality => true

  def change_participation
    self.update_attribute(:participate, !self.participate)
  end


  def self.mass_invite(email_name_string)
    email_name_string.lines.reduce([]) do |members, line|
      email, name = line.split(',')
      raise "ugyldig format. både epost (#{email}) og navn (#{name}) må oppgis. Kontroller din input ved å trykke BACK knappen i nettleseren" if email.nil? || name.nil?
      email = email.chomp
      if Member.find_by_email(email)
         puts "member #{email} exists"
      else
        puts "inviting #{email}"
        members << {email: email, name: name.gsub('"','').chomp}
      end
      members
    end
  end

  def self.mass_invite!(email_name_string)
    mass_invite(email_name_string).each do |m|
      Member.invite!(m)
    end.count
  end
end
