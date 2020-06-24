$(function(){
  function buildMESSAGE(message) {
    var messages = $('tbody').append('<tr class="messages" data-id=' + message.id + '><td>' + message.text + '</td><td><a href="/messages/' + message.id + '">Show</a></td><td><a href="/messages/' + message.id +'/edit">Edit</a></td><td><a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/messages/' + message.id + '">Destroy</a></td>');
    //'tbody'に'tr'以下のhtml全てをappendする
  } 


$(function(){
  $(function(){
    setInterval(update, 10000);
    //10000ミリ秒ごとにupdateという関数を実行する
  });

   function update(){
    var message_id = $('.messages:last').data('id'); //一番最後にある'messages'というクラスの'id'というデータ属性を取得し、'message_id'という変数に代入
     
     
    $.ajax({
      url: location.href, //urlは現在のページを指定
      type: 'GET', //メソッドを指定
      data: { //railsに引き渡すデータは
        likes: like_count //このような形(paramsの形をしています)で、'id'には'message_id'を入れる
      },
      dataType: 'json' //データはjson形式
      
      .always(function(data){ //通信したら、成功しようがしまいが受け取ったデータ（@new_message)を引数にとって以下のことを行う
      $.each(data, function(i, data){ //'data'を'data'に代入してeachで回す
        buildMESSAGE(data); //buildMESSAGEを呼び出す
      });
    })
  }
);
}
});