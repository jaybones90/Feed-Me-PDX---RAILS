class Seed

  FoodCart.destroy_all
  Subscriber.destroy_all

  def self.begin
    seed = Seed.new
    seed.generate_carts
    seed.generate_subscribers
  end

  def generate_subscribers
    phone_numbers = ["+18584885368", "+16503021483", "+16508685904", "+16503028563"]
    4.times do |i|
      subscriber = Subscriber.create!(
        from_number: phone_numbers[i]
      )
      4.times do |i|
        message = subscriber.messages.create!(
        body: Faker::Lorem.sentence
        )
        2.times do |i|
          message.replies.create!(
          to_phone_number: subscriber.from_number,
          body: Faker::ChuckNorris.fact
          )
        end
      end
    end
  end

  def generate_carts
    20.times do |i|
      owner = Owner.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.phone_number
      )
      cart = owner.food_carts.create!(
        name: Faker::Company.name,
        hours: "8am - 5pm",
        email: Faker::Internet.email,
        password: "1234567",
        password_confirmation: "1234567"
        )
      location = cart.locations.create!(
          address: Faker::Address.street_address,
          city: "Portland",
          state: "OR",
          zip: Faker::Address.zip,
          pod: Faker::Address.community
      )
      puts "created #{i} carts"
      puts "created #{i} locations"
      puts "created #{i} owners"
    end
  end

end

Seed.begin
