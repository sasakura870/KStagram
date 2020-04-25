$(document).on('turbolinks:load', function() {
$(function() {
  
  $('.nametitle').hover(
    function(){
      $('.about_name_shousai').fadeIn(3000);
  },
  function(){
$('.about_name_shousai').fadeOut(2000);
  }
  );
  
  $('.nametitle').hover(
    function(){
      $('.about_name_shousai1').fadeIn(4000);
  },
  function(){
$('.about_name_shousai1').fadeOut(1000);
  }
  );
  $('.aboutbtn_math').click(function() {
    $('.active').removeClass('active');
    
    // 変数clickedIndexを定義し、クリックしたボタンのインデックス番号を代入してください
    var clickedIndex = $('.aboutbtn_math').index($(this));
    
    // eqの引数をclickedIndexに書き換えてください
    $('.slide').eq(clickedIndex).addClass('active');
    
  });
});
});