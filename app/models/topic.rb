class Topic < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :admins, class_name: 'User', join_table: 'admins_topics', associated_foreign_key: 'user_id'
  has_and_belongs_to_many :subscribers, class_name: 'User', join_table: 'subscriber_topics', associated_foreign_key: 'user_id'
  has_many :messages
end
