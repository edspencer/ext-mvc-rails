require 'find'

module ExtMvcRails
  class JavascriptExpansions
    def self.register
      register_ext
      register_ext_mvc
      register_ext_applications
      register_initializers
    end
    
    def self.register_ext
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :ext => ['ext/adapter/ext/ext-base.js', 'ext/ext-all-debug']
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :ext_extensions => ['ext/search-field', 
                                                                                            'ext/data-view-plugins',
                                                                                            'ext/renderers']
                                                                                            
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :ext_grid_filter => ['ext/ux/menu/EditableItem',
                                                                                             'ext/ux/menu/RangeMenu',
                                                                                             'ext/ux/grid/GridFilters',
                                                                                             'ext/ux/grid/filter/Filter',
                                                                                             'ext/ux/grid/filter/StringFilter',
                                                                                             'ext/ux/grid/filter/DateFilter',
                                                                                             'ext/ux/grid/filter/ListFilter',
                                                                                             'ext/ux/grid/filter/NumericFilter',
                                                                                             'ext/ux/grid/filter/BooleanFilter']
    end
    
    def self.register_ext_mvc
      base         = js_files_in_directory('ext-mvc')
      lib          = js_files_in_directory('ext-mvc/lib')
      desktop      = js_files_in_directory('ext-mvc/lib/LayoutManagers/Desktop')
      initializers = js_files_in_directory('ext-mvc/initializers')
      helpers      = js_files_in_directory('ext-mvc/helpers')
      controllers  = ['ext-mvc/controller/base', 'ext-mvc/controller/crud_controller', 'ext-mvc/controller/singleton_controller']
      models       = js_files_in_directory('ext-mvc/model')
      views        = js_files_in_directory('ext-mvc/view')
      view_dirs    = Dir.entries("#{Rails.root}/public/javascripts/ext-mvc/view").reject {|v| v =~ /\./}
      views       += view_dirs.collect {|v| js_files_in_directory("ext-mvc/view/#{v}")}.flatten
      
      #need to include lib before window here to make Tiny MCE editor windows work.  curses
      app_files    = js_files_in_directory('ext-mvc/app') + js_files_in_directory('ext-mvc/app/lib') + js_files_in_directory('ext-mvc/app/window')
      
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :ext_mvc => base + lib + desktop + initializers + helpers + controllers + models + views + app_files
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
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :plugins      => js_files_in_directory('plugins')
      ActionView::Helpers::AssetTagHelper.register_javascript_expansion :initializers => js_files_in_directory('initializers')
    end
    
    private
    # returns all files in the collection which end in .js, then strips the .js extension as these are not needed in the helper
    def self.js_files_in_directory dirname
      collection = Dir.entries("#{Rails.root}/public/javascripts/#{dirname}")
      collection.select {|c| c.split(".").last == 'js'}.collect {|js| "#{dirname}/#{js.gsub(/.js$/, '')}"}
    end
    
    #returns an array of application names.  Applications must be installed under public/javascripts/apps
    def self.find_applications
      Dir.entries("public/javascripts/apps").select {|d| File.directory?("public/javascripts/apps/#{d}") && !(d =~ /\./)}
    end
    
    #given an application directory, returns all files for that application in the correct order
    def self.find_application_files appname
      files  = js_files_in_directory("apps/#{appname}")
      files += js_files_in_directory("apps/#{appname}/controllers") if File.exists?("#{Rails.root}/public/javascripts/apps/#{appname}/controllers")
      files += js_files_in_directory("apps/#{appname}/views")       if File.exists?("#{Rails.root}/public/javascripts/apps/#{appname}/views")
      files += js_files_in_directory("apps/#{appname}/models")      if File.exists?("#{Rails.root}/public/javascripts/apps/#{appname}/models")
      files += js_files_in_directory("apps/#{appname}/lib")         if File.exists?("#{Rails.root}/public/javascripts/apps/#{appname}/lib")
      
      files
    end
  end
end
