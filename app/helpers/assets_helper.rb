module AssetsHelper
  USER_ASSETS_PATH = "#{Rails.root}/public/user_assets"

  def relative_path(dir, name)
    full_path = "#{dir}/#{name}"
    full_path.split("#{AssetsHelper::USER_ASSETS_PATH}/")[1]
  end

  def asset_list(dir)
    Dir.chdir(dir)
    assets = Dir.glob("*").map do |asset|
      {name: asset, kind: File.file?(asset) ? 'file' : 'dir'}
    end
    
    unless Dir.pwd == AssetsHelper::USER_ASSETS_PATH
      assets = assets.push({name: "..", kind: 'dir'})
    end
    
    assets = assets.sort_by! {|entry| entry[:name]}
    assets = assets.sort_by! {|entry| entry[:kind]}
    # assets = assets.map {|entry| entry[:name]}
  end  
end
