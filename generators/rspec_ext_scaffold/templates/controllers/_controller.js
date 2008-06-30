<%= namespace %>.controllers.<%= controller_class_name %>Controller = Ext.extend(CrudController, {
  constructor: function(config) {
    <%= namespace %>.controllers.<%= controller_class_name %>Controller.superclass.constructor.call(this, {
      model      : <%= namespace %>.models.<%= class_name %>, 
      indexPanel : <%= namespace %>.views.<%= table_name %>.Index,
      editPanel  : <%= namespace %>.views.<%= table_name %>.Edit,
      newPanel   : <%= namespace %>.views.<%= table_name %>.New
    });
  }
});
