# FIXME: NOT ACTUALLY FUNCTIONAL YET, GIVES AN ERROR
class << ActionController::Routing::RouteSet::Mapper; self;end.class_eval do
  def batch_destroy *resources
    resources.each do |r|
      self.send("batch_destroy_#{r}", "/admin/batch_destroy_#{r}.:format", :controller => "admin", :action => 'destroy_batch', :model => r, :conditions => {:method => :delete})
    end
  end
  
  def ext_tree *resources
    resources.each {|r| self.send("connect", "/admin/#{r}/tree.:format", :controller => "Admin::#{r.to_s.classify.pluralize}", :action => 'tree', :model => r)}
    resources.each {|r| self.send("connect", "/admin/#{r}/reorder/:id.:format", :controller => "Admin::#{r.to_s.classify.pluralize}", :action => 'reorder', :model => r)}
  end 
end