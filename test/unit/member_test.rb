# -*- encoding : utf-8 -*-
require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "create member" do
  	 attributes = members(:one).attributes.merge(:email => '#{rand}@member.test')		
  	 Member.create!(attributes)
  end
end
