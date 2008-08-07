/**
 * <%= namespace %>.views.<%= class_name %>.Edit
 * @extends Ext.ux.MVC.view.DefaultEditForm
 * <%= class_name %> Edit Form
 */
<%= namespace %>.views.<%= class_name %>.Edit = function(config) {
  var config = config || {};
  
  Ext.applyIf(config, {
    model: <%= namespace %>.models.<%= class_name %>,
    items: <%= namespace %>.views.<%= class_name %>.FormFields
  });
  
  <%= namespace %>.views.<%= class_name %>.Edit.superclass.constructor.call(this, config);
};
Ext.extend(<%= namespace %>.views.<%= class_name %>.Edit, Ext.ux.MVC.view.DefaultEditForm);
Ext.reg('<%= file_name %>_edit', <%= namespace %>.views.<%= class_name %>.Edit);