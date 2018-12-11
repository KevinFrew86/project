require_relative( "../models/animal.rb" )
require_relative( "../models/owner.rb" )
require_relative( "../models/adoption.rb" )
require("pry-byebug")

Animal.delete_all()
Owner.delete_all()
# Adoption.delete_all()


owner1 = Owner.new({
  "name" => "John"
})

owner1.save()


owner2 = Owner.new({
  "name" => "Kathryn"
})

owner2.save()


owner3 = Owner.new({
  "name" => "Rab"
})

owner3.save()


animal1 = Animal.new({
  "name" => "Chonky",
  "type" => "Dog",
  "breed" => "Mastiff",
  "admission_date" => "0218",
  "trained" => "t",
  "health" => "f",
  "owner_id" => owner2.id
})

animal1.save()


animal2 = Animal.new({
  "name" => "Shaz",
  "type" => "Cat",
  "breed" => "British shorthair",
  "admission_date" => "0618",
  "trained" => "false",
  "health" => "false",
  "owner_id" => owner1.id
})

animal2.save()


animal3 = Animal.new({
  "name" => "Gavin",
  "type" => "Dog",
  "breed" => "Shnoodle",
  "admission_date" => "1018",
  "trained" => true,
  "health" => true,
  "owner_id" => owner2.id
})

animal3.save()


animal4 = Animal.new({
  "name" => "Dave",
  "type" => "Cat",
  "breed" => "Murmese",
  "admission_date" => "1218",
  "trained" => true,
  "health" => true,
  "owner_id" => owner3.id
})

animal4.save()


animal5 = Animal.new({
  "name" => "Helen",
  "type" => "Dog",
  "breed" => "Whippet",
  "admission_date" => "0417",
  "trained" => true,
  "health" => false,
  "owner_id" => nil
})

animal5.save()


animal6 = Animal.new({
  "name" => "Mandy",
  "type" => "Cat",
  "breed" => "Tonkinese",
  "admission_date" => "0218",
  "trained" => false,
  "health" => true,
  "owner_id" => nil
})

animal6.save()



binding.pry
nil
