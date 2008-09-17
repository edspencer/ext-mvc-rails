/**
 * Ext.ux.App.<%= app_name %>.view.Edit
 * @extends Ext.ux.App.view.DefaultEditWindow
 * <%= class_name %> Manager edit <%= class_name %> view
 */
Ext.ux.App.<%= app_name %>.view.Edit = function(config) {
  var config = config || {};
  
  Ext.applyIf(config, {
    model: Ext.ux.App.<%= app_name %>.<%= class_name %>,
    formConfig: {
      items: Ext.ux.App.<%= app_name %>.view.FormFields()
    }
  });
  
  Ext.ux.App.<%= app_name %>.view.Edit.superclass.constructor.call(this, config);
};
Ext.extend(Ext.ux.App.<%= app_name %>.view.Edit, Ext.ux.App.view.DefaultEditWindow);
Ext.reg('<%= namespace %>_edit', Ext.ux.App.<%= app_name %>.view.Edit);