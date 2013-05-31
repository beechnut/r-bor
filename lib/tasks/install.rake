require 'fileutils'

namespace :rbor do
  desc "Install files to run the plugin"
  task :install do

    @filepath = ""
    @my_path = FileUtils.pwd

    puts "R-BOR by beechnut (http://github.com/beechnut)"
    puts "Codebase located at #{@my_path}."

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

  # FIXME: Fix failover function here
  if @filepath == "" and File.exists?(File.expand_path("config/filepath"))
    puts "\nFailover file `filepath` found in app/config/, listing"
    path_to_read = File.expand_path "config/filepath"
    File.open(path_to_read).each { |line| @filepath << line }
    puts @filepath
    puts "as the location of the Sketchup plugins folder."
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
  puts "\nERROR: We couldn't find the plugins folder in the usual location."
  puts "Open Sketchup, select Window > Ruby Console, and run:"
  puts "\n"
  puts "\tSketchup.find_support file \"plugins\""
  puts "\n"
  puts "Copy and paste the result into a new file in app/config/"
  puts "named `filepath`."
  puts "\n"
end


def install_support_file_in(filepath)  
  source      = File.expand_path "config/rbor_support.rb"
  destination = File.expand_path filepath
  
  FileUtils.cp(source, destination)
  puts "\n\tAttempted to install support file at"
  puts "\t#{filepath}.\n\n"

  if File.exists? File.expand_path(destination, "rbor_support.rb")
    puts "\tAttempting to edit file."
    file_to_edit = destination + "/rbor_support.rb"
    f = File.open(file_to_edit, "a+")
    f << "Dir[\"#{@my_path}/app/**/*.rb\"].each { |f| load(f) }"
    f.close
    
    puts "\tInstallation of support file `rbor_support` was successful!"
    puts "\n\tNow open Sketchup and get growing!!"
    puts "\n"
  end
  
end








