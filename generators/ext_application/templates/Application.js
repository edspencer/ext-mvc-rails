/**
 * Ext.ux.App.<%= app_name %>
 * @extends Ext.ux.App.Base
 * @version 0.1
 * Provides <%= class_name %> model CRUD
 */
Ext.ux.App.<%= app_name %> = function(config) {
  var config = config || {};
  
  this.version = 0.1;
  
  this.model      = Ext.ux.App.<%= app_name %>.<%= class_name %>;
  this.controller = new Ext.ux.App.<%= app_name %>.<%= app_name %>Controller({
    model: this.model,
    app:   this
  });
  
  this.id = '<%= namespace %>-win';
  
  this.init = function() {
    this.launcher = {
      text:    '<%= class_name %> Management',
      iconCls: '<%= file_path %>',
      handler: this.launch,
      scope:   this
    };
  };
  
  Ext.ux.App.<%= app_name %>.superclass.constructor.call(this, config);
};
Ext.extend(Ext.ux.App.<%= app_name %>, Ext.ux.App.Base);

Ext.ns("Ext.ux.App.<%= app_name %>.view");