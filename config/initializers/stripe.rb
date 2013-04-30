if Rails.env.to_s == "production"
  Stripe.api_key = ENV['STRIPE_TOKEN']
else
  Stripe.api_key = "1q8i3li8JhIXRi4lU2sXLIf91nxhDYVf"  # Test Secrete Key
end

if Rails.env.to_s == "production"
  STRIPE_PUBLIC_KEY = ENV['STRIPE_PUBLIC_KEY']
else
  STRIPE_PUBLIC_KEY = "pk_HgvTFebTaKx6va86KHCHAAo77KMus"  # Test Publishable Key

end
