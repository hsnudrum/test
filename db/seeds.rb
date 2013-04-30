# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

UserMailer.perform_deliveries = false

AdminUser.create!(email: 'admin@example.com',
                  password: 'password',
                  password_confirmation: 'password')

for id in 1..20
  user_email = "user#{id}@example.com"
  user = User.create!(email: user_email, 
                      password: "password",
                      terms_of_service: "1")

  credit_card_token_id = Stripe::Token.create(card: {
                                                number: "4242424242424242",
                                                exp_month: 1,
                                                exp_year: 2020,
                                                cvc: 314 }).id

  card = user.build_card(day_phone: "781-555-#{'%04d' % id}",
                         stripe_card_token: credit_card_token_id,
                         paid: false,
                         cardholder_name: "John Doe, #{id.ordinalize}",
                         billing_address: "#{id} Main St",
                         city: "Agawam",
                         state: "MA",
                         postal_code: "01#{'%03d' % id}")
  card.save_with_payment(nil)

  if id.odd?
    user.contact_feewises.create!(to: "info@feewise.com",
                                  cc: "webmaster@feewise.com",
                                  subject: "Contact feeWise form",
                                  body: "This is message #{id}.\nThanks,\nJohn Doe, #{id.ordinalize}",
                                  email: user_email)
  else
    ContactFeewise.create!(to: "info@feewise.com",
                           cc: "webmaster@feewise.com",
                           subject: "Contact feeWise form",
                           body: "This is message #{id}.\nThanks,\nJoe Schmoe, #{id.ordinalize}",
                           email: "jschmoe#{id}@example.com")
  end
end

ContactFeewise.create!(to: "info@feewise.com",
                       cc: "webmaster@feewise.com",
                       subject: "Contact feeWise form",
                       body: "This is an anonymous message.\nThanks,\nJoe Schmoe (oops!)",
                       email: nil)

for id in 1..20
  Subscription.create!(email: "subscriber#{id}@example.com")
end

UserMailer.perform_deliveries = true
