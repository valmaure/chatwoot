class Webhooks::SmsController < ActionController::API
  def process_payload
    Webhooks::SmsEventsJob.perform_later(params['_json']&.first&.to_unsafe_hash)
    head :ok
  end
  skip_before_action :verify_authenticity_token

  def receive_sms
     # Exemple de logique pour traiter les webhooks de réception de SMS
    sender_number = params[:From]

    message_body = params[:Body]

    # Utilisez les données des paramètres de la requête pour traiter le webhook

    render plain: "Webhook de réception de SMS traité avec succès", status: :ok
  end
  end

  def send_sms
    recipient_number = params[:To]
    message_body = params[:Body]

    # Utilisez les données des paramètres de la requête pour traiter le webhook

    render plain: "Webhook d'envoi de SMS traité avec succès", status: :ok
  end
end




