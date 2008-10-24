namespace(:ext_mvc) do
  
  desc "Creates ext-mvc-all.js and ext-mvc-all-min.js files (expects java to be installed and the yui-compressor to be located at ../yui-compressor"
  task :create_minified_files => :environment do
    concatenated_filename = "public/javascripts/ext/ux/mvc/ext-mvc-all.js"
    minified_filename     = "public/javascripts/ext/ux/mvc/ext-mvc-all-min.js"
    
    #creates public/javascripts/ext/ux/mvc/ext-mvc-all.js
    ExtMvcRails::JavascriptExpansions.concatenate_and_minify
    
    #performs concatentation of ext-mvc-all.js to ext-mvc-all-min.js
    FileUtils.rm(minified_filename) if File.exists?(minified_filename)
    system("java -jar ../yui-compressor/build/yuicompressor-2.4.jar #{concatenated_filename} -o #{minified_filename}")
  end
  
end