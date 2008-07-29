require 'ext_scaffold_core_extensions/active_record/base'
require 'ext_scaffold_core_extensions/array'
require 'ext_tree_extensions/active_record/base'
require 'ext_tree_extensions/action_controller/base'
require 'ext_datetime_extensions/active_record/base'
require 'routing/routes'

ActiveRecord::Base.send(:include, ExtScaffoldCoreExtensions::ActiveRecord::Base)
ActiveRecord::Base.send(:include, ExtTreeExtensions::ActiveRecord::Base)
ActiveRecord::Base.send(:include, ExtDatetimeExtensions::ActiveRecord::Base)
ActionController::Base.send(:include, ExtTreeExtensions::ActionController::Base)
Array.send(:include, ExtScaffoldCoreExtensions::Array)

#Edge seemed to break this, required necessary libs by hand above instead
# Load CoreExtensions
# Dir[File.join("#{File.dirname(__FILE__)}", 'lib', 'ext_scaffold_core_extensions', '**', '*.rb')].each do |f|
#   extension_module = f.sub(/(.*)(ext_scaffold_core_extensions.*)\.rb/,'\2').classify.constantize
#   base_module = f.sub(/(.*ext_scaffold_core_extensions.)(.*)\.rb/,'\2').classify.constantize
#   base_module.class_eval { include extension_module }
# end