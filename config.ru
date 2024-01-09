# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application


require 'sinatra'
require 'json'
require 'stripe'
# This is your test secret API key.
Stripe.api_key = 'sk_test_51ORXbsFEMuWuHbiilWvWlqxXXRNUwRQOEcVDXM5t1smeffA7dHHDu9C7QU1lUPKQUugQ1P9pFaZTVF4R7KZV4Xa0005FCXKnJV'
# Replace this endpoint secret with your endpoint's unique secret
# If you are testing with the CLI, find the secret by running 'stripe listen'
# If you are using an endpoint defined with the API or dashboard, look in your webhook settings
# at https://dashboard.stripe.com/webhooks
endpoint_secret = 'whsec_...';

set :port, 4242

post '/webhook' do
  payload = request.body.read
  event = nil

  begin
    event = Stripe::Event.construct_from(
      JSON.parse(payload, symbolize_names: true)
    )
  rescue JSON::ParserError => e
    # Invalid payload
    puts "⚠️  Webhook error while parsing basic request. #{e.message}"
    status 400
    return
  end
  # Check if webhook signing is configured.
  if endpoint_secret
    # Retrieve the event by verifying the signature using the raw body and secret.
    signature = request.env['HTTP_STRIPE_SIGNATURE'];
    begin
      event = Stripe::Webhook.construct_event(
        payload, signature, endpoint_secret
      )
    rescue Stripe::SignatureVerificationError => e
      puts "⚠️  Webhook signature verification failed. #{e.message}"
      status 400
    end
  end

  # Handle the event
  case event.type
  when 'payment_intent.succeeded'
    payment_intent = event.data.object # contains a Stripe::PaymentIntent
    puts "Payment for #{payment_intent['amount']} succeeded."
    # Then define and call a method to handle the successful payment intent.
    # handle_payment_intent_succeeded(payment_intent)
  when 'payment_method.attached'
    payment_method = event.data.object # contains a Stripe::PaymentMethod
    # Then define and call a method to handle the successful attachment of a PaymentMethod.
    # handle_payment_method_attached(payment_method)
  else
    puts "Unhandled event type: #{event.type}"
  end
  status 200
end

// index.js or server.js

const express = require('express');
const webpush = require('web-push');

# Charger les clés VAPID depuis les variables denvironnement
const VAPID_PUBLIC_KEY = process.env.VAPID_PUBLIC_KEY;
const VAPID_PRIVATE_KEY = process.env.VAPID_PRIVATE_KEY;

 Configurer web-push avec les clés VAPID
webpush.setVapidDetails(
  'mailto:jernhice.matoko@topcenter.cg',
  VAPID_PUBLIC_KEY,
  VAPID_PRIVATE_KEY
);

// Créer et configurer votre application Express
const app = express();

// ... Autres configurations et routes ...

// Démarrer le serveur
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
