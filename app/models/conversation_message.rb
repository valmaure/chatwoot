# app/models/conversation_message.rb

class ConversationMessage < ApplicationRecord
    belongs_to :conversation
    belongs_to :user, optional: true # Le message peut ne pas être associé à un utilisateur (par exemple, dans le cas de messages système)
  
    enum message_type: { incoming: 0, outgoing: 1, system: 2 } # Types de messages
  
    validates :content, presence: true
  
    scope :latest, -> { order(created_at: :desc) }
  
    # D'autres logiques de modèle peuvent être ajoutées en fonction des besoins de l'application
  end
  