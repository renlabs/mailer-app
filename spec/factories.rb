FactoryGirl.define do

	factory :user do
		username  "renss"
		email		  "ren@rensssss.com"
		password  "password"
		password_confirmation { |u| u.password }
	end

end