class TranscodingsController < ApplicationController
  def index
    @transcodings = Transcoding.order('created_at desc')
  end

  def new
  end
  
  def create
    # binding.pry
    @transcoding = Transcoding.new(trascoding_params)
    # render text: params

    respond_to do |format|
      if @transcoding.save
        TranscodingWorker.perform_async(@transcoding.id)        
        format.html { redirect_to transcodings_path }
        format.json { render action: 'show', status: :created, location: @transcoding }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @transcoding.errors, status: :unprocessable_entity }
        format.js
      end
    end    
    
  end
  
  private
  def trascoding_params
    params.require(:transcoding).permit(:infile, :outfile, :format, :state, :quality, :scale, :xxx, :yyy, :zzz)
  end
  
end
