class Message < ApplicationRecord
    belongs_to :creator, class_name: "User", foreign_key: "user_id"
    belongs_to :topic
    
    after_save :broadcast_message
    after_destroy :remove_message

    private

    def broadcast_message
      ActionCable.server.broadcast("message_channel", {method: "add", message_id: self.id.to_s, text: self.content, user_email: self.creator.email, topic_id:  self.topic.id.to_s, creator_id: self.creator.id })
    end

    def remove_message
        ActionCable.server.broadcast("message_channel", {method: "remove", message_id: self.id.to_s, topic_id:  self.topic.id.to_s})
    end
end
