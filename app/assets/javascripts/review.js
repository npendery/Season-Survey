$('.upvote').on('click', function(event) {
  event.preventDefault();
  var url = $(this).attr('href');
  var voteTotal
  $.ajax({
    type: 'POST',
    url: url,
    dataType: 'json',
  })
});
