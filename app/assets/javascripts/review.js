$('.upvote').on('click', function(event) {
  event.preventDefault();
  var url = $(this).attr('href');
  var voteTotal = $(this).parent().find('.vote-total');
  $.ajax({
    type: 'POST',
    url: url,
    dataType: 'json',
    success: function(response) {
      voteTotal.text(response);
    }
  });
});

$('.downvote').on('click', function(event) {
  event.preventDefault();
  var url = $(this).attr('href');
  var voteTotal = $(this).parent().find('.vote-total');
  $.ajax({
    type: 'POST',
    url: url,
    dataType: 'json',
    success: function(response) {
      voteTotal.text(response);
    }
  });
});
