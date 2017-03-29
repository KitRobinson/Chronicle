class ChangeRecipientToConversation < ActiveRecord::Migration
  def change
  	rename_column :messages, :reference_id, :conversation_id
  end
end
