class Cake < ActiveRecord::Base
    has_many :cake_photos, :inverse_of =>  :cake

end
