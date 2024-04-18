class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_topics, class_name: 'Topic', foreign_key: 'user_id'
  has_and_belongs_to_many :administered_topics, class_name: 'Topic', join_table: 'admins_topics', associated_foreign_key: 'topic_id'
  has_and_belongs_to_many :subscribed_topics, class_name: 'Topic', join_table: 'subscriber_topics', associated_foreign_key: 'topic_id'
  has_many :messages
end
