/**
 * <%= namespace %>.views.<%= file_name %>.Index
 * @extends Ext.ux.MVC.view.DefaultPagingGridWithTopToolbar
 * Grid view for the <%= class_name %> model
 */
<%= namespace %>.views.<%= file_name %>.Index = function(config) {
  var config = config || {};
  
  Ext.applyIf(config, {
    model: <%= namespace %>.models.<%= class_name %>,
    headings: [
<%= field_collection.fields.collect {|f| "      { header: '#{f.field_name.humanize}', dataIndex: '#{f.field_name}', type: 'string', editor: new Ext.form.TextField({allowBlank: #{f.validates_presence ? 'false' : 'true'}})}"}.join(",\n") %>
    ]
  });
  
  <%= namespace %>.views.<%= file_name %>.Index.superclass.constructor.call(this, config);
};
Ext.extend(<%= namespace %>.views.<%= file_name %>.Index, Ext.ux.MVC.view.DefaultPagingGridWithTopToolbar);
Ext.reg('<%= file_name %>_index}', <%= namespace %>.views.<%= file_name %>.Index);
