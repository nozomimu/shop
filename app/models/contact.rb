class Contact < ApplicationRecord
	validates :name,:kana_name,:email,:phone, :message,presence: true,length: {maximum:1000}
end
