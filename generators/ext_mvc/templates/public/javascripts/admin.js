Ext.onReady(function(){
  application = new Application();
  
  application.registerController(DashboardController,  'DashboardController');
  
  new DashboardController().viewIndex();
});
