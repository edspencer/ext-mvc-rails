/**
 * Ext.ux.App.<%= app_name %>.view.New
 * @extends Ext.ux.App.view.DefaultNewWindow
 * <%= class_name %> Manager new <%= class_name %> form window
 */
Ext.ux.App.<%= app_name %>.view.New = function(config) {
  var config = config || {};
  
  Ext.applyIf(config, {
    model: Ext.ux.App.<%= app_name %>.<%= class_name %>,
    formConfig: {
      items: Ext.ux.App.<%= app_name %>.view.FormFields()
    }
  });
  
  Ext.ux.App.<%= app_name %>.view.New.superclass.constructor.call(this, config);
};
Ext.extend(Ext.ux.App.<%= app_name %>.view.New, Ext.ux.App.view.DefaultNewWindow);
Ext.reg('<%= namespace %>_new', Ext.ux.App.<%= app_name %>.view.New);