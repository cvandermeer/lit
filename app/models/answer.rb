class Answer < ActiveRecord::Base
  ### RELATIONS ###
  belongs_to :question

  ### VALIDATIONS ###
  # Look in the question model

  ## UPLOADER ##
  mount_uploader :image, ImageUploader
end
