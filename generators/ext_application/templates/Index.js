/**
 * Ext.ux.App.<%= app_name %>.view.Index
 * @extends Ext.ux.App.view.DefaultGridWindow
 * Index action view for <%= class_name %> Manager
 */
Ext.ux.App.<%= app_name %>.view.Index = function(config) {
  var config = config || {};
  
  Ext.applyIf(config, {
    iconCls: '<%= file_path %>',
    title:   '<%= class_name %> Manager',
    
    gridConfig: {
      model:   Ext.ux.App.<%= app_name %>.<%= class_name %>,
      columns: Ext.ux.App.<%= app_name %>.view.GridColumns()
    }
  });
  
  Ext.ux.App.<%= app_name %>.view.Index.superclass.constructor.call(this, config);
};
Ext.extend(Ext.ux.App.<%= app_name %>.view.Index, Ext.ux.App.view.DefaultGridWindow);
Ext.reg('<%= namespace %>_index', Ext.ux.App.<%= app_name %>.view.Index);