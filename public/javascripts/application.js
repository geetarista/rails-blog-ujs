$(function() {
  $("#new_comment")
    .live("ajax:beforeSend", function(event, xhr, settings) {
      $("#new-comment-error").hide();
    })
    .live("ajax:success", function(event, data, status, xhr) {
      if (data.success == true) {
        $("#comments").prepend(data.html);
      } else {
        console.log("SHOW ERROR");
        $("#new-comment-error").show();
      }
    });
  // $("#new_comment").live('submit', function(event) {
  //   $form = $(this);

  //   $.ajax({
  //     url: $form.attr('href'),
  //     data: $form.serialize(),
  //     dataType: 'json',
  //     success: function(data) {
  //       console.log("DATA:");
  //       console.log(data)
  //     }
  //   });

  //   event.preventDefault();
  // });
});
