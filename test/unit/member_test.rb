# -*- encoding : utf-8 -*-
require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  test "create member" do
    Member.create!(:email => '#{rand}@member.test',
                    name: 'olli',
                    password: "password",
                    password_confirmation: "password",
                    postcode: 2222,
                    city: "byyy",
                    country: "Norge"
     )
  end
end
