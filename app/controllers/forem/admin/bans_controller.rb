module Forem
  module Admin
    class BansController < BaseController

      def index
        @bans = Forem::Ban.all
      end

      def new
        @ban = Forem::Ban.new
      end

      def create
        @ban = Forem::Ban.new params[:ban]
        unless @ban.user_id == @ban.banned_by_user
          my_date = "#{params[:ban]['banned_until(1i)']}-#{params[:ban]['banned_until(2i)']}-#{params[:ban]['banned_until(3i)']} #{params[:ban]['banned_until(4i)']}:#{params[:ban]['banned_until(5i)']}:#{Time.now.sec}".to_time # problem? :trollface:
          @ban.banned_until = my_date
          @ban.save
          flash[:notice] = "User was successfully banned."
        else
          flash[:error] = "Failed to ban the user."
        end
        redirect_to admin_bans_path
      end

      def edit
        @ban = Forem::Ban.find(params[:id])
      end

      def update
        @ban = Forem::Ban.find(params[:id])
        if @ban.update_attributes(params[:ban])
          flash[:notice] = "Ban updated."
        else
          flash[:error] = "Failed to update ban."
        end
        redirect_to admin_bans_path
      end

      def destroy
        @ban = Forem::Ban.find(params[:id])
        if @ban.destroy
          flash[:notice] = "Ban deleted."
        else
          flash[:error] = "Failed to delete ban."
        end
        redirect_to admin_bans_path
      end

    end
  end
end
