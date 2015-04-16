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

  // $(document).on('click', '.show-new-player-invitation', function() {
  //   $('.invite-players').removeClass('hidden')
  // });

  // $(document).on('click', '#invitation-submit-button', function () {
  //   $('.invite-players').addClass('hidden')
  // })

  // $(document).on('click', '.show-new-email', function() {
  //   $('.email-players').removeClass('hidden')
  //   $(this).toggleClass('hidden')
  // });

  // $(document).on('click', '#email-submit-button', function() {
  //   $('.email-players').addClass('hidden')
  //   $('.show-new-email').toggleClass('hidden')
  // });

  // $(document).on('click', '.text-all-players', function() {
  //   $('.text-players').removeClass('hidden')
  //   $(this).addClass('hidden')
  // });

  // $(document).on('click', '.text-button', function(e) {
  //   e.preventDefault();
  //   var form = $('.text-button').closest('form')
  //   var message = form.serializeArray()[1].value
  //   var url = form.attr("action")
  //   var team = $(this).attr("team");
  //   $('.text-players').addClass('hidden')
  //   $('.text-all-players').removeClass('hidden')
  //   var data = {"message": message, "team": team}
  //   var response = $.ajax({
  //     url: url,
  //     method: 'post',
  //     data: data,
  //     "success": function(response) {
  //     }
  //   })
  // });



  // $(document).on('click', '.edit-amount-owed-button', function() {
  //   $(this).toggleClass('hidden')
  //   $(this).next().removeClass('hidden')
  // });

  $(document).on('click', '.member', function(e) {
    e.preventDefault();
    $(this).toggleClass('active-player')
    $(this).find('.hidden').toggleClass('hidden')
    
    console.log(this.id)
  });



});