Ext.ux.App.<%= app_name %>.view.FormFields = function() {
  return [
<% model.content_columns.each do |c| %>
    { fieldLabel: '<%= c.name.humanize %>', name: '<%= file_path %>[<%= c.name %>]'}<%= c == model.content_columns.last ? '' : ',' %><% end %>
  ];
};