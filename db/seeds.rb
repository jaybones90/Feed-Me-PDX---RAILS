class Seed

  FoodCart.destroy_all

  def self.begin
    seed = Seed.new
    seed.generate_carts
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
        hours: "8am - 5pm"
        )
      location = cart.create_location!(
          address: Faker::Address.street_address,
          city: "Portland",
          state: "OR",
          zip: Faker::Address.zip,
          pod: Faker::Address.community
      )
    end
    # puts "created #{i} carts"
    # puts "created #{i} locations"
    # puts "created #{i} owners"
  end

end

Seed.begin
