class Webhooks::TelegramController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
 
  def process_payload
    Webhooks::TelegramEventsJob.perform_later(params.to_unsafe_hash)
    head :ok
  end
end

  # Exemple de gestionnaire de webhook pour les messages entrants dans Chatwoot
  def incoming_message
    authenticate_with_basic_auth do
      
      # Logique pour traiter la demande de webhook Telegram ici
      
      # Vous pouvez accéder aux données du message dans params
      render plain: "Webhook Telegram traité avec succès", status: :ok
    end
  end

  private

  def authenticate_with_basic_auth
    authenticate_or_request_with_http_basic do |username, password|


      # Ajoutez votre logique d'authentification ici, si nécessaire


      username == 'votre_nom_utilisateur' && password == 'votre_mot_de_passe'
    end
  end
end

