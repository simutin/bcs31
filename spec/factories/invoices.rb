FactoryGirl.define do
  factory :invoice do
    sequence(:number) do |n|
      digits = Invoice::DIGITS_IN_NUMBER
      random_part_of_number = rand(10**(digits - 2)..10**(digits - 1) - 1).to_s
      (n.to_s + random_part_of_number).first(digits).to_i
    end
    send_from         { Faker::AddressUS.city }
    arrival_to        { Faker::AddressUK.city }
    recipient_surname { Faker::Name.last_name }

    factory :singular_invoice do
      status            { Invoice.status.values.sample }
      recipient_role    { Invoice.recipient_role.values.sample }
    end
  end
end
