/**
 * <%= namespace %>.views.<%= class_name %>.New
 * @extends Ext.ux.MVC.view.DefaultNewForm
 * New <%= class_name %> form
 */
<%= namespace %>.views.<%= class_name %>.New = function(config) {
  var config = config || {};
  
  Ext.applyIf(config, {
    model: <%= namespace %>.models.<%= class_name %>,
    items: <%= namespace %>.views.<%= class_name %>.FormFields
  });
  
  <%= namespace %>.views.<%= class_name %>.New.superclass.constructor.call(this, config);
};
Ext.extend(<%= namespace %>.views.<%= class_name %>.New, Ext.ux.MVC.view.DefaultNewForm);
Ext.reg('<%= file_name %>_new', <%= namespace %>.views.<%= class_name %>.New);