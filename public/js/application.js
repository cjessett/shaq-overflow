$(document).ready(function() {
// VOTING
  var up = $("div.question-cell > div.vote-cell > a.fa-thumbs-up.user");
  var down = $("div.question-cell > div.vote-cell > a.fa-thumbs-down.user");

  up.click(function(event) {
    event.preventDefault();

    var question_url = up.attr('href');
    var posting = $.post(question_url);

    posting.done(function(data) {

      data = JSON.parse(data);

      var buttons = $("div.question-cell > div.vote-cell > a");
      var counter = $("div.question-cell > div.vote-cell > .vote-count");

      buttons.removeClass("active");
      counter.text(data.total);
      color_changer(data.value);
    });
  });

  down.click(function(event) {
    event.preventDefault();

    var question_url = down.attr('href');
    var posting = $.post(question_url);

    posting.done(function(data) {
      data = JSON.parse(data);

      var buttons = $("div.question-cell > div.vote-cell > a");
      var counter = $("div.question-cell > div.vote-cell > .vote-count");

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

// BEGIN QUESTION COMMENT FIELD
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

// BEGIN ANSWER COMMENT FIELD


});
