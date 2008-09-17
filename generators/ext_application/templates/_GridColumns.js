Ext.ux.App.<%= app_name %>.view.GridColumns = function() {
  return [
<% model.content_columns.each do |c| %>
    { header: '<%= c.name.humanize %>', dataIndex: '<%= c.name %>', type: '<%= c.type == :integer ? "int" : "string" %>'}<%= c == model.content_columns.last ? '' : ',' %><% end %>
  ];
};