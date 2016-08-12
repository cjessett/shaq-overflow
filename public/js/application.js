$(document).ready(function() {

  // VOTING
  var up = $("#up");
  var down = $("#down");
  var voteButton = $("a.q-vote");

  voteButton.click(function(event) {
    event.preventDefault();
    var $button = $(this);

    var questionUrl = $button.attr('href');
    var voteVal = $button.attr('val');
    var voteData = { "vote": voteVal}

    var posting = $.post(questionUrl, voteData);

    posting.done(function(data) {
      data = JSON.parse(data);

      var buttons = $("a.q-vote");
      var counter = $("#vote-count");

      buttons.removeClass("active");
      counter.text(data.total);
      color_changer(data.value);
    });
  });

  function color_changer(value) {
    if (value === 1) {
      up.addClass("active");
    }
    else if (value === -1) {
      down.addClass("active");
    }
  }

// ===============================================

  // QUESTION COMMENT SCRIPT
  $("form#question_comment").submit(function(event) {
    event.preventDefault();

    var $form = $(this);
    var data = $form.serialize();
    var post_url = $form.attr('action');

    var posting = $.post(post_url, data);
    posting.done(function(data) {
      $("div#all_question_comments").append(data);
      $form.trigger("reset");
    });
  });

  // ANSWER COMMENT SCRIPT


});
