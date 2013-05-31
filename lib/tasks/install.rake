# file_name = File.expand_path("/Library/Application\ Support/Google Sketchup 8/SketchUp/plugins")
namespace :rbor do
  desc "Install files to run the plugin"
  task :install do

    @filepath = ""

    puts "R-BOR by beechnut (http://github.com/beechnut)"

    search_for_plugin_locations
  end
end



def search_for_plugin_locations
  likely_plugin_locations = ["/Library/Application Support/Google Sketchup 8/SketchUp/plugins",
                             "/Library/Application Support/Google Sketchup 8/SketchUp/Plugins",
                             "/Library/Application Support/Google Sketchup 7/Plugins",
                             "/Library/Application Sketchup Support/Google 7/SketchUp/Plugins",
                             "~/Library/Application Support/Google Sketchup 8/Sketchup/plugins",
                             "~/Library/Application Support/Google Sketchup 7/Plugins"]

  likely_plugin_locations.each do |filepath|
    if File.exists?( File.expand_path( filepath ) )
      puts "\n\tFound plugins folder at"
      puts "\t#{filepath}"
      @filepath = filepath ; break
    end
  end

  if File.exists? File.expand_path "../../config/filepath"
    puts "Failover file `filepath` found in app/config/."
    path_to_read = File.expand_path "../../config/filepath"
    @filepath = File.open path_to_read
  else
    "Failover does not exist."
  end

  if @filepath == ""
    print_error_message
  else
    install_support_file_in @filepath
  end
end



def print_error_message
  puts "\nInstalling support file `rbor.rb` to #{ filepath }"
  puts "`rbor.rb` loads the files in this repo into Sketchup for use at runtime."

  puts "\nERROR: We couldn't find the plugins folder in the usual location."
  puts "Open Sketchup, select Window > Ruby Console, and run:"
  puts "\n"
  puts "\t\tSketchup.find_support file \"plugins\""
  puts "\n"
  puts "Copy and paste the result into a new file in app/config/"
  puts "named `plugin_location`."
end


def install_support_file_in(filepath)
  puts "\n\tInstalled support file at"
  puts "\t#{filepath}.\n\n"
end








