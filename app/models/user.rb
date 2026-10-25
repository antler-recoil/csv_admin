require "csv"

class User < ApplicationRecord
  CSV_HEADERS = ["ID", "First Name", "Last Name", "Email", "Role", "Last Login (UTC)"]
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << CSV_HEADERS

      all.each do |user|
        csv << [
          user.id,
          user.first_name,
          user.last_name,
          user.email,
          user.role,
          user.last_login_at&.utc&.strftime("%Y-%m-%d %H:%M:%S")
        ]
      end
    end
  end
end
