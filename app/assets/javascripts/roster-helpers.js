$(document).ready(function() {

  // $(document).on('click', '.game-time', function(e) {
  //   $(this).siblings(':last').toggleClass('hidden')
  // })

  // $(document).on('click', '.change-rsvp-show', function(e) {
  //   e.preventDefault();
  //   $(this).find(">:first-child").addClass('hidden')
  //   $(this).find(">:last-child").removeClass('hidden')
  // })

  // $(document).on('click', '.text-msg', function(e) {
  //   e.preventDefault();
  //   $('.text-msg').addClass('hidden');
  //   $('.text-msg-box').removeClass('hidden');
  // });

  // $(document).on('click', '.captain-msg', function(e) {
  //   e.preventDefault();
  //   var player = $(this)
  //   player_id = player.attr("id")
  //   $('.' + player_id).removeClass('hidden');
  // })

  // $(document).on('click', '#text-submit-button', function(e){
  //   e.preventDefault();
  //   $('.' + player_id).addClass('hidden');
  //   var message = { "body": $(".text-msg-box").val(), "to": $(this).attr('to'), "from": $(this).attr('from'), "phone": $(this).attr('phone')}
  //   var response = $.ajax({
  //     url: '/send_sms',
  //     method: 'post',
  //     data: message,
  //     "success": function(response) {
  //     }
  //   })
  // })

  // $(document).on('click', '#text-player-button', function(e){
  //   e.preventDefault();
  //   $('.text-msg').removeClass('hidden');
  //   $('.text-msg-box').addClass('hidden');
  //   var data = $(this).closest("form").serializeArray()[1].value;
  //   var message = { "body": data, "to": $(this).attr('to'), "from": $(this).attr('from'), "phone": $(this).attr('phone')}
  //   $("textarea.text-msg-box").val('')
  //   console.log(message)
  //   var response = $.ajax({
  //     url: '/send_sms',
  //     method: 'post',
  //     data: message,
  //     "success": function(response) {
  //     }
  //   })
  // })

  // $(document).on('click', '.change-rsvp', function(e) {
  //   e.preventDefault();
  //   var partial = $(this)
  //   var data = $(this).attr('data')
  //   var route = $(this).parent().attr('action')
  //   var response = $.ajax({
  //     url: route,
  //     method: "patch",
  //     data: {attendance: data},
  //     error: function(response) {
  //       partial.closest('.game-view').replaceWith(response.responseText)
  //     }
  //   })
  // });

  $(document).on('click', '.edit-amount-owed', function(e) {
    e.stopPropagation();
  });

  $(document).on('click', '.mark-paid', function(e) {
    e.preventDefault();

    var form = $(this).parent();

    $.ajax({
      url: form.attr('action'),
      method: 'put',
      data: form.serialize(),
      dataType: 'html',
      success: function(response) {
        // console.log(response);
        $(form.parent()).html(response)},
      error: function(response) {
          console.log(response);
        }
    });

  });

  $(document).on('click', '.mark-unpaid', function(e) {
    e.preventDefault();

    var form = $(this).parent();

    $.ajax({
      url: form.attr('action'),
      method: 'put',
      data: form.serialize(),
      dataType: 'html',
      success: function(response) {
        // console.log(response);
        $(form.parent()).html(response)},
      error: function(response) {
          console.log(response);
        }
    });

  });

$(document).on('click', '.remove-player', function(e) {
    e.stopPropagation();
  });

$(document).bind('submit', '.remove-player', function(e) {

    var confirmDelete = window.confirm("Are you sure you want to delete this player?");
    if (confirmDelete == false) {
      e.preventDefault();
    };

  });

  $(document).on('click', '.member', function() {
    var activePlayerId = this.id

    $(this).toggleClass('active-player');
    $(this).find('.edit-amount-owed').toggleClass('hidden');
    $(this).find('.remove-player').toggleClass('hidden');
    $(this).find('.mark-unpaid').toggleClass('hidden');
    $(this).find('.mark-paid').toggleClass('hidden');
    $(this).find('.amount-owed-div').toggleClass('display-none');
    $(this).find('.mark-paid-div').toggleClass('display-none');
    $(this).find('.mark-unpaid-div').toggleClass('display-none');

    });


    // $(this).on('click', '.mark-paid', function(e){
    //   e.preventDefault();
    //   console.log(this)
    // });
    // console.log(activePlayerId)




});