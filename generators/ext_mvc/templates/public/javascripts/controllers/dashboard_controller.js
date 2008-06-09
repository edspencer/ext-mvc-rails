DashboardController = function(config) {
  DashboardController.superclass.constructor.call(this, config);
};

Ext.extend(DashboardController, ApplicationController, {
  viewIndex: function() {
    this.showPanel(new DashboardIndexPanel());
  }
});