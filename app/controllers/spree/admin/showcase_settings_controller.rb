module Spree
  module Admin
    class ShowcaseSettingsController < BaseController
      helper Spree::StoreHelper
      helper Spree::BaseHelper
      include Spree::Core::ControllerHelpers::Order

      def show
        @preferences = [:enabled,
                        :thumbnail_style,
                        :showcase_style,
                        :number_of_slides_to_show]
      end

      def edit
        @preferences = [:enabled,
                        :thumbnail_style,
                        :showcase_style,
                        :number_of_slides_to_show]
      end

      def update
        params.each do |name, value|
          next unless SpreeShowcase::Config.has_preference? name
          SpreeShowcase::Config[name] = value
        end

        redirect_to admin_showcase_settings_path
      end
    end
  end
end