$(function(){
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $subsubimageboxs = $(".subsubimageboxs");
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $subsubimageboxs.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $subsubimageboxs.append($('<img>').attr({
                  src: e.target.result,
                  width: "150px",
                  class: "subsubimageboxs",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
});