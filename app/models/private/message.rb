class Private::Message < ApplicationRecord
    self.table_name = 'private_messages'

    has_many :messages, 
         class_name: "Private::Message", 
         foreign_key: :conversation_id
    belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
    belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'

    has_many :private_messages, class_name: 'Private::Message'
    has_many  :private_conversations, 
          foreign_key: :sender_id, 
          class_name: 'Private::Conversation'

end