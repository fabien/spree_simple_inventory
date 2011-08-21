//= require admin/jquery.jeditable

$(function() {
  $("#inventory td.editable").editable("/admin/inventory/inline", {
     submitdata : function(value, settings) {
       var id = $(this).parent('tr').attr('id').replace(/^variant_/, '');
       var param = $(this).data('param');
       return { id: id, param: param };
     },
     width : 64,
     height: 20
  });
});