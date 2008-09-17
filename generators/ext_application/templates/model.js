Ext.ux.App.<%= app_name %>.<%= class_name %> = new Ext.ux.MVC.model.Base('<%= file_path %>', {
  fields: [
    { name: 'id', type: 'int'},
<% model.content_columns.each do |c| %>
    { name: '<%= c.name %>', type: '<%= c.type == :integer ? "int" : "string" %>'}<%= c == model.content_columns.last ? '' : ',' %><% end %>
  ]
});