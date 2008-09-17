/**
 * Ext.ux.App.<%= app_name %>.<%= app_name %>Controller
 * @extends Ext.ux.App.CrudController
 * <%= class_name %> controller - basic CRUD
 */
Ext.ux.App.<%= app_name %>.<%= app_name %>Controller = function(config) {
  var config = config || {};
  
  Ext.applyIf(config, {
    viewsPackage        : "Ext.ux.App.<%= app_name %>.view",
    viewWindowNamespace : '<%= namespace %>'
  });
  
  Ext.ux.App.<%= app_name %>.<%= app_name %>Controller.superclass.constructor.call(this, config);
};
Ext.extend(Ext.ux.App.<%= app_name %>.<%= app_name %>Controller, Ext.ux.App.CrudController);
