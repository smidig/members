class AddParticipateToMembers < ActiveRecord::Migration
  def change
    add_column :members, :participate, :boolean, :default => false
  end
end
