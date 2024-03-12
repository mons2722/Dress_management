
// Assuming you're using jQuery for AJAX
$(document).on('click', '.delete-dress-button', function() {
    var dressId = $(this).data('dress-id');
    
    if (confirm("Are you sure you want to delete this dress?")) {
      $.ajax({
        url: '/dresses/' + dressId,
        method: 'DELETE',
        success: function(response) {
          // Handle successful deletion
          // For example, you might redirect to another page or update the UI
        },
        error: function(xhr, status, error) {
          // Handle errors
          console.error(xhr.responseText);
        }
      });
    }
  });
  