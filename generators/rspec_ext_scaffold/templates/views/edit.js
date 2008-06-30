/**
 * <%= namespace %>.views.<%= file_name %>.Edit
 * @extends Ext.ux.MVC.view.DefaultEditForm
 * <%= class_name %> Edit Form
 */
<%= namespace %>.views.<%= file_name %>.Edit = function(config) {
  var config = config || {};
  
  Ext.applyIf(config, {
    model: <%= namespace %>.models.<%= class_name %>,
    items: <%= namespace %>.views.<%= file_name %>.FormFields
  });
  
  <%= namespace %>.views.<%= file_name %>.Edit.superclass.constructor.call(this, config);
};
Ext.extend(<%= namespace %>.views.<%= file_name %>.Edit, Ext.ux.MVC.view.DefaultEditForm);
Ext.reg('<%= file_name %>_edit}', <%= namespace %>.views.<%= file_name %>.Edit);