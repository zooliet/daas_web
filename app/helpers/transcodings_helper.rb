module TranscodingsHelper  
  def media_properties(asset)
    skip_properties = ['container', 'time', 'creation_time', 'rotation']
    
    media = FFMPEG::Movie.new(asset)
		properties = media.to_yaml.gsub(/\n\s+/, ' ').split(/\n/)
    # puts "***#{media.to_yaml}"    
		properties.delete_at(0)
    # puts "***#{properties}"
    properties.map do |property| 
      name, value = property.split(": ")
      value = value.split("#{AssetsHelper::USER_ASSETS_PATH}/")[1] if name == 'path'
      {name: name, value: value}
    end.reject { |entry| entry if skip_properties.include?(entry[:name]) }
    
    # results = results.reject do |entry|
    #   # binding.pry      
    #   entry if entry[:name] == 'container'
    # end  
    
    # results
  end  
end

