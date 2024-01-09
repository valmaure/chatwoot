class Webhooks::LineController < ActionController::API
  def process_payload
    Webhooks::LineEventsJob.perform_later(params: params.to_unsafe_hash, signature: request.headers['x-line-signature'], post_body: request.raw_post)
    head :ok

    before_action :authenticate_user!  # Exemple d'une vérification d'authentification

 def send_sms
      # Logique pour envoyer un SMS
      # Utilisation de bibliothèques comme Twilio, Nexmo, etc.
      
      recipient_number = params[:recipient_number]
      message_body = params[:message_body]
  
      # Exemple avec Twilio
      twilio_client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
      twilio_client.messages.create(
        body: message_body,
        from: TWILIO_PHONE_NUMBER,
        to: recipient_number
      )
  
      render json: { status: 'success', message: 'SMS sent successfully' }
    rescue => e
      render json: { status: 'error', message: "Failed to send SMS: #{e.message}" }
    end
  end
end
