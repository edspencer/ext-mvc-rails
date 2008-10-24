require "find"

module ExtMvcRails
  class JavascriptExpansions
    
    @@basedir = "ext/ux/mvc"
    
    def self.register
      register_ext
      register_ext_mvc
      register_ext_applications
      register_initializers
    end
    
    def self.register_ext
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :ext => ["ext/adapter/ext/ext-base.js", "ext/ext-all-debug"]
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :ext_extensions => ["ext/search-field", 
                                                                                            "ext/data-view-plugins",
                                                                                            "ext/renderers"]
                                                                                            
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :ext_grid_filter => ["ext/ux/menu/EditableItem",
                                                                                             "ext/ux/menu/RangeMenu",
                                                                                             "ext/ux/grid/GridFilters",
                                                                                             "ext/ux/grid/filter/Filter",
                                                                                             "ext/ux/grid/filter/StringFilter",
                                                                                             "ext/ux/grid/filter/DateFilter",
                                                                                             "ext/ux/grid/filter/ListFilter",
                                                                                             "ext/ux/grid/filter/NumericFilter",
                                                                                             "ext/ux/grid/filter/BooleanFilter"]
    end
    
    def self.register_ext_mvc
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :ext_mvc => self.find_ext_mvc_files
    end
    
    #creates an expansion for each application, and an expansion for all applications.  e.g. if application UserManager exists
    #under public/javascript/apps, then the following expansions are created:
    # :ext_app_user_manager
    # :ext_apps
    def self.register_ext_applications
      all_files = []
      find_applications.each do |app|
        files = find_application_files(app)
        all_files += files
        
        appname = "ext_app_#{app.underscore}".intern
        ActionView::Helpers::AssetTagHelper.register_javascript_expansion appname => files
      end
      
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :ext_apps => all_files
    end
    
    def self.register_initializers
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :plugins      => js_files_in_directory("plugins")
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :initializers => js_files_in_directory("initializers")
    end
    
    def self.concatenate_and_minify
      concatenated_filename = "public/javascripts/#{@@basedir}/ext-mvc-all.js"
      
      #remove old files, create blank ones again
      if File.exists?(concatenated_filename)
        File.delete(concatenated_filename)
        puts "Deleted old file"
      end
      FileUtils.touch(concatenated_filename)
      
      file = File.open(concatenated_filename, 'w') do |f|
        find_ext_mvc_files.each do |i|
          f.puts(IO.read("public/javascripts/#{i}.js"))
          f.puts("\n")
        end
      end
    end
    
    private
    # returns all files in the collection which end in .js, then strips the .js extension as these are not needed in the helper
    def self.js_files_in_directory dirname
      collection = Dir.entries("#{Rails.root}/public/javascripts/#{dirname}")
      collection.select {|c| c.split(".").last == "js"}.collect {|js| "#{dirname}/#{js.gsub(/.js$/, '')}"}
    end
    
    #recursively finds all javascript files in the given directory and all its subdirectories
    def self.recursive_js_files_in_directory dirname
      files = []
      files += js_files_in_directory(dirname)
        
      find_subdirectories("#{Rails.root}/public/javascripts/#{dirname}").each do |subdir|
        files += recursive_js_files_in_directory("#{dirname}/#{subdir}").flatten
      end
      
      return files.flatten
    end
    
    #returns an array of application names.  Applications must be installed under public/javascripts/apps
    def self.find_applications
      find_subdirectories("public/javascripts/apps")
    end
    
    def self.find_subdirectories(directory)
      Dir.entries(directory).select {|d| File.directory?("#{directory}/#{d}") && !(d =~ /\./)}
    end
    
    #given an application directory, returns all files for that application in the correct order
    def self.find_application_files appname
      files  = js_files_in_directory("apps/#{appname}")
      files += js_files_in_directory("apps/#{appname}/controllers")     if File.exists?("#{Rails.root}/public/javascripts/apps/#{appname}/controllers")
      files += recursive_js_files_in_directory("apps/#{appname}/views") if File.exists?("#{Rails.root}/public/javascripts/apps/#{appname}/views")
      files += js_files_in_directory("apps/#{appname}/models")          if File.exists?("#{Rails.root}/public/javascripts/apps/#{appname}/models")
      files += js_files_in_directory("apps/#{appname}/lib")             if File.exists?("#{Rails.root}/public/javascripts/apps/#{appname}/lib")
      
      files
    end
    
    def self.find_ext_mvc_files
      base         = js_files_in_directory(@@basedir)
      lib          = js_files_in_directory("#{@@basedir}/lib")
      desktop      = js_files_in_directory("#{@@basedir}/lib/LayoutManagers/Desktop")
      initializers = js_files_in_directory("#{@@basedir}/initializers")
      helpers      = js_files_in_directory("#{@@basedir}/helpers")
      controllers  = ["#{@@basedir}/controller/base", "#{@@basedir}/controller/crud_controller", "#{@@basedir}/controller/singleton_controller"]
      models       = js_files_in_directory("#{@@basedir}/model")
      views        = js_files_in_directory("#{@@basedir}/view")
      view_dirs    = Dir.entries("#{Rails.root}/public/javascripts/#{@@basedir}/view").reject {|v| v =~ /\./}
      views       += view_dirs.collect {|v| js_files_in_directory("#{@@basedir}/view/#{v}")}.flatten
      
      #need to include lib before window here to make Tiny MCE editor windows work.  curses
      app_files    = js_files_in_directory("#{@@basedir}/app") + js_files_in_directory("#{@@basedir}/app/lib") + js_files_in_directory("#{@@basedir}/app/grid") + js_files_in_directory("#{@@basedir}/app/window")
      
      return [base + lib + desktop + initializers + helpers + controllers + models + views + app_files].flatten
    end
  end
end
