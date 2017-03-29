class AddLastVisitToUserConversations < ActiveRecord::Migration

  def change
  	add_column :user_conversations, :last_visit, :datetime
  end

end
