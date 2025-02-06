class Private::Conversation < ApplicationRecord
    self.table_name = 'private_conversations'

    belongs_to :user
    belongs_to :conversation, 
               class_name: 'Private::Conversation',
               foreign_key: :conversation_id
  
end