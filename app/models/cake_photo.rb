class CakePhoto < ActiveRecord::Base
   belongs_to :cake
   has_attached_file :photo,
    :styles => {
      :thumb=> "100x100#",
      :small  => "150x150>" }
end