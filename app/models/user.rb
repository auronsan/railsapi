class User < ApplicationRecord


    validates_presence_of :username,:email, :created_by
end
