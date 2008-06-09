<%= controller_class_name %>Controller = Ext.extend(CrudController, {
  constructor: function(config) {
    <%= controller_class_name %>Controller.superclass.constructor.call(this, {
      model      : <%= class_name %>, 
      indexPanel : <%= class_name %>IndexPanel,
      editPanel  : <%= class_name %>EditPanel,
      newPanel   : <%= class_name %>NewPanel
    });
  }
});
