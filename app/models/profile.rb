class Profile < ApplicationRecord
  store_accessor :language, :native_language
  store_accessor :language, :target_language
end
