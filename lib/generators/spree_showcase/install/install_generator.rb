module SpreeShowcase
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../assets", __FILE__)

      def messages
        @messages||= []
      end

      def copy_message
        status = status.to_s.capitalize
        "Copy #{@source} into #{@dest}..."
      end

      def add_overrides
      end

      def add_javascripts
      end

      def add_stylesheets
      end

      def add_partials
        puts %q{This partial is the template structure for displaying the slideshow and also includes the settings for the JavaScript plugin.}

        @source = "partials/_showcase.html.erb"
        @dest = "app/views/spree/slides/_showcase.html.erb"
        if copy_file(@source, @dest)
          messages << copy_message
        else
          messages << copy_message
        end
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_showcase'
      end

      def run_migrations
         res = ask 'Would you like to run the migrations now? [Y/n]'
         if res == '' || res.downcase == 'y'
           run 'bundle exec rake db:migrate'
         else
           puts 'Skiping rake db:migrate, don\'t forget to run it!'
         end
      end

      def complete
        puts "\n-------- Files copied --------\n"
        puts messages.join("\n")
        puts "\n---------------------------------\n"
        puts "\nEverything is done! To summarize, _showcase.html.erb => HTML template, showcase.css.scss & showcase.js.erb => assets. Edit these 3 files to fit run the slideshow."
        puts "\nPlease run rake assets:clean (IMPORTANT) to clear any precompiled assets from fresh install of Spree."
      end
    end
  end
end
