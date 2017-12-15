
class IconsController < ApplicationController

	def index
      @icons = Icon.all
   end
   
   def new
      @icon = Icon.new
   end
   
   def create
      @icon = Icon.new(icon_params)
      
      if @icon.save
      	 render :json => { cid: @icon.id, url: @icon.attachment_url }
      else
         render "new"
      end
   end
      
   private
      def icon_params
	    params.require(:icon).permit(:attachment)
	  end
  
end
