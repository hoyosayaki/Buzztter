$(function(){
  
  function updateLike(data) {
    $('.iine-count').text(data);
  }
  
  $(function(){
    setInterval(update, 1000);
  });

  function update(){
  $.ajax({ //ajax通信で以下のことを行う
      url: location.href, //urlは現在のページを指定
      type: 'GET', //メソッドを指定
      dataType: 'json' //データはjson形式
    })
    .always(function(data){ //通信したら、成功しようがしまいが受け取ったデータ（@new_message)を引数にとって以下のことを行う
      $.each(data, function(i, data){ //'data'を'data'に代入してeachで回す
        updateLike(data);
      });
    });
  }
});