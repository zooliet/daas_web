class AssetsController < ApplicationController
  def index
    if params[:path].present?
      @asset_dir = "#{AssetsHelper::USER_ASSETS_PATH}/#{params[:path]}"
    else
      @asset_dir = AssetsHelper::USER_ASSETS_PATH
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def show
    @asset = "#{params[:path]}.#{params[:format]}"
    @asset = @asset.split("user_assets/")[1]
    @asset = "#{AssetsHelper::USER_ASSETS_PATH}/#{@asset}"
    # @asset = "#{params[:path]}.#{params[:format]}"
  end

  def create
    if params[:kind] == 'dir'
      new_dir = "#{params[:path]}/#{params[:dir_name]}"
      begin
        FileUtils.mkdir new_dir        
      rescue Exception => e
        puts "***No way..."
      end      
    else # params[:kind] == 'file'
      # binding.pry      
      if params[:file_name].present?        
        f = params[:file_name].open
        new_file  = "#{params[:path]}/#{params[:file_name].original_filename}"        
        temp_file = f.path
        FileUtils.mv(temp_file, new_file) 
      end
    end
    # render text: params
    redirect_to :back
  end
  
  def destroy
    target = params[:path].split("/user_assets/")[1]
    target = "#{AssetsHelper::USER_ASSETS_PATH}/#{target}"    
    FileUtils.rm_rf target, verbose: true
    puts "***#{target}"
    
    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
