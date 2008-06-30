<%= namespace %>.models.<%= class_name %> = new Ext.ux.MVC.model.Base('<%= file_name %>', {
  fields: [
    { name: 'id', type: 'int'},
<%= field_collection.fields.collect {|f| "    { name: '#{f.field_name}', type: 'string'}"}.join(",\n") %>
  ]
});