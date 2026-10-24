# db/seeds.rb
User.destroy_all

users = [
  ["Priya",    "Raman",      "admin"],
  ["Marcus",   "Johnson",    "admin"],
  ["Elena",    "Petrova",    "editor"],
  ["Tomás",    "Alvarez",    "editor"],
  ["Aisha",    "Khan",       "viewer"],
  ["Daniel",   "O'Connor",   "viewer"],
  ["Mei",      "Zhang",      "editor"],
  ["Oluwaseun","Adeyemi",    "viewer"],
  ["Sofia",    "Rossi",      "viewer"],
  ["Liam",     "Fischer",    "editor"],
  ["Hannah",   "Berg",       "viewer"],
  ["Rahul",    "Mehta",      "admin"],
  ["Chloe",    "Dubois",     "viewer"],
  ["Kenji",    "Watanabe",   "editor"],
  ["Fatima",   "Al-Sayed",   "viewer"],
  ["Noah",     "Williams",   "viewer"],
  ["Isabella", "Costa",      "editor"],
  ["Gabriel",  "Nowak",      "viewer"]
]

users.each_with_index do |(first, last, role), i|
  User.create!(
    first_name: first,
    last_name:  last,
    email:      "#{first}.#{last}".downcase.gsub(/[^a-z.]/, "") + "@example.com",
    role:       role,
    # Spread logins over the last ~60 days; leave one user who has never logged in
    last_login_at: i == 16 ? nil : (i * 3 + rand(1..48)).hours.ago - (i * 2).days
  )
end

puts "Seeded #{User.count} users."
