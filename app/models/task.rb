class Task < ActiveRecord::Base
  mount_uploader :media, MediaUploader
  TODOS = [['Tanscoding','Tanscoding']]
end
