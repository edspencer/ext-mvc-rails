<%= namespace %>.controllers.<%= controller_class_name %>Controller = Ext.extend(Ext.ux.MVC.controller.CrudController, {
  constructor: function(config) {
    <%= namespace %>.controllers.<%= controller_class_name %>Controller.superclass.constructor.call(this, {
      model      : <%= namespace %>.models.<%= class_name %>, 
      namespace  : '<%= namespace %>'
    });
  }
});
