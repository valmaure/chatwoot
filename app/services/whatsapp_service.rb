 app/services/whatsapp_service.rb


 #account_sid: 'ACa94aad198da847162cc490452aeba527'
 #auth_token: 'dab9ad34b7a6d18fec0c7e915e4da92e'
 #phone_number: '+14807250732'
 #whatsapp_phone_number: '+24204495353'
 #api_key_sid: 'votre_api_key_sid'     # authentification du token
 #api_key_secret: 'votre_api_key_secret' #clé unique de l api


class WhatsappService
    def initialize(api_key_sid, api_key_secret, account_sid)
      @client = Twilio::REST::Client.new(api_key_sid, api_key_secret, account_sid)
    end
  
    def send_whatsapp_message(to, body)
      # Logique pour envoyer un message WhatsApp

    @client.messages.create(
        to: "whatsapp:#{to}",
        from: "whatsapp:#{@twilio_whatsapp_number}",
        body: body #(le corps du message)
      )
    end
  
    # Autres méthodes liées à WhatsApp...
  end
  