$(function() {
  $('input[type="submit"]').click(function() {
    var username = $("#username").val();
    var password = $("#password").val();
    $('.login').addClass('test');
    setTimeout(function() {
      $('.login').addClass('testtwo');
    }, 300);
    setTimeout(function() {
      $('.authent').show().animate({
        right: -320
      }, {
        easing: 'easeOutQuint',
        duration: 600,
        queue: false
      });
      $('.authent').animate({
        opacity: 1
      }, {
        duration: 200,
        queue: false
      }).addClass('visible');
    }, 500);

    $.ajax({
        url: 'loginServlet',
        type: 'post',
        dataType: 'text',
        data: {
          'user': username,
          'pwd': password
        }
      })
      .done(function(data) {
        if ($.trim(data) == "true") {
          console.log('成功');
          processLogin();
        } else {
          errorLogin();
          console.log('失败');
        }
      })
      .fail(function() {
        console.log("error");
      })

    function errorLogin() {
      setTimeout(function() {
        $('.authent').show().animate({
          right: 90
        }, {
          easing: 'easeOutQuint',
          duration: 600,
          queue: false
        });
        $('.authent').animate({
          opacity: 0
        }, {
          duration: 200,
          queue: false
        }).addClass('visible');
        $('.login').removeClass('testtwo');
      }, 1000);

      //主要是这两个处理登录的结果
      setTimeout(function() {
        $('.login').removeClass('test');
        $('.login div').fadeOut(123);
      }, 1000);
      setTimeout(function() {
        $('.error').fadeIn();
      }, 1000);
    }

    function processLogin() {
      var $mainJsp = $(".mainJsp");
      $mainJsp.on('click', function(event) {
        window.location = "welcome.jsp";
      });
      setTimeout(function() {
        $('.authent').show().animate({
          right: 90
        }, {
          easing: 'easeOutQuint',
          duration: 600,
          queue: false
        });
        $('.authent').animate({
          opacity: 0
        }, {
          duration: 200,
          queue: false
        }).addClass('visible');
        $('.login').removeClass('testtwo');
      }, 1000);

      //主要是这两个处理登录的结果
      setTimeout(function() {
        $('.login').removeClass('test');
        $('.login div').fadeOut(123);
      }, 1000);
      setTimeout(function() {
        $('.success').fadeIn();
      }, 1000);
    }

  });
  $('input[type="text"],input[type="password"]').focus(function() {
    $(this).prev().animate({
      'opacity': '1'
    }, 200);
  });
  $('input[type="text"],input[type="password"]').blur(function() {
    $(this).prev().animate({
      'opacity': '.5'
    }, 200);
  });
  $('input[type="text"],input[type="password"]').keyup(function() {
    if (!$(this).val() == '') {
      $(this).next().animate({
        'opacity': '1',
        'right': '30'
      }, 200);
    } else {
      $(this).next().animate({
        'opacity': '0',
        'right': '20'
      }, 200);
    }
  });
  var open = 0;
  $('.tab').click(function() {
    $(this).fadeOut(200, function() {
      $(this).parent().animate({
        'left': '0'
      });
    });
  });
});