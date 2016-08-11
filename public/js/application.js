$(document).ready(function() {
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


});
