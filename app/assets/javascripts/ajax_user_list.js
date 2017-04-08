// インクリメントサーチ
$(function(){
  var
  preFunc = null,
  preInput = '',
  input = '',

  ajaxPost = function(input)
  {
    $.ajax({
      url: "/groups/ajax_user_list",
      type: "GET",
      data: ("q=" + input)
    });
  };

  $('#user-search-field').on('keyup', function() {
    var input = $.trim($(this).val());
    if(preInput !== input && input.length !== 0){
      clearTimeout(preFunc);
      preFunc = setTimeout(ajaxPost(input), 500);
    }
    preInput = input;
  });

//userをリストに追加する

  $('#user-search-result').on('click', '.ajax_user_list', function(){
    var element = $(this);
    var id = element.data('userId');
    var nickname = element.data('userName');
    var html =
    '<div class= "chat-group-user clearfix", id= "chat-group-user-' + id +'" >' +
    '<input type= "hidden", name= "group[user_ids][]" value= '+ id +'>' +
    '<p class= "chat-group-user__name">'
    + nickname +
    '</p>' +
    '<button class= "user_list_remove", type= "button", data-user-id= "'+ id +'"> 削除' +
    '</button>' +
    '</div>';
    $('#chat-group-users').append(html);
    $('#user_'+ id +'').remove();
  });

  //userを削除する
  $("#chat-group-users").on('click', '.user_list_remove', function(){
    var element = $(this);
    var id = element.data("userId");
    $('#chat-group-user-' + id +'').remove();
  });
});
