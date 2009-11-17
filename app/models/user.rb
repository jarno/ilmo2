class User < ActiveRecord::Base
	 validates_presence_of :name, :hashed_password
   validates_confirmation_of :hashed_password
   validates_length_of :name, :minimum => 2
end
