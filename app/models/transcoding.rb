class Transcoding < ActiveRecord::Base
  Format  = ['AVI', 'MP4', 'WMV', 'FLV']
  Quality = ['Best', 'Good', 'Normal', 'Poor']
  
  validates_presence_of :infile
  
  attr_accessor :xxx, :yyy, :zzz
end
