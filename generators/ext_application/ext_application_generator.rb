class ExtApplicationGenerator < Rails::Generator::NamedBase
  
  attr_accessor :app_name, :namespace, :model
  
  def initialize(runtime_args, runtime_options = {})
    super
    @app_name  = "#{class_name}Manager"
    @namespace = "#{file_path}-manager"
    
    @model     = class_name.classify.constantize
  end
  
  def manifest 
    record do |m|
      apps_dir        = "public/javascripts/apps"
      app_dir         = "#{apps_dir}/#{@app_name}"
      controllers_dir = "#{apps_dir}/#{@app_name}/controllers"
      views_dir       = "#{apps_dir}/#{@app_name}/views"
      models_dir      = "#{apps_dir}/#{@app_name}/models"
      
      m.directory(app_dir); m.directory(models_dir); m.directory(views_dir); m.directory(controllers_dir)
      
      m.template("Application.js", "#{app_dir}/#{@app_name}.js")
      
      m.template("Controller.js",  "#{controllers_dir}/#{@app_name}Controller.js")
      m.template("Model.js",       "#{models_dir}/#{class_name}.js")
      
      m.template("New.js",          "#{views_dir}/New.js")
      m.template("Edit.js",         "#{views_dir}/Edit.js")
      m.template("Index.js",        "#{views_dir}/Index.js")
      m.template("_GridColumns.js", "#{views_dir}/_GridColumns.js")
      m.template("_FormFields.js",  "#{views_dir}/_FormFields.js")
    end
  end
end