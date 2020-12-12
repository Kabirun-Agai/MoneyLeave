

$(function () {


  $(document).on('turbolinks:load', function (){
    if ($('#calendar').length) {

      function eventCalendar() {
          return $('#calendar').fullCalendar({
          });
      };

      function clearCalendar() {
          $('#calendar').html('');
      };

      $(document).on('turbolinks:load', function () {
        eventCalendar();
      });

      $(document).on('turbolinks:before-cache', clearCalendar);

      

      $('#calendar').fullCalendar({
        events: '/events.json',
        locale: 'ja',
        height: 'auto',
        titleFormat: 'YYYY年 M月',
        dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
        buttonText: {
          prev: '前',
          next: '次',
          prevYear: '前年',
          nextYear: '翌年',
          today: '今日',
          month: '月',
          week: '週',
          day: '日'
      },
      　timeFormat: "HH:mm",
        navLinks: true,
        selectable: true,
        selectHelper: true,

        timezone: 'UTC',
        editable: true,
        /*非同期通信的なの
      　　今後実行していきたい
        dayClick: function (start, jsEvent, view) {
          //クリックした日付情報を取得
          const year = moment(start).year();
          const month = moment(start).month()+1; //1月が0のため+1する
          const day = moment(start).date();
          //イベント登録のためnewアクションを発火
          $.ajax({
            type: 'GET',
            url: '/events/new',
          }).done(function (res) {
            //イベント登録用のhtmlを作成
            $('.priority').html(res);
           
            //イベント登録フォームのモーダル表示
            $('.modal fade').show()
            // 成功処理
          }).fail(function (result) {
            // 失敗処理
            alert('エラーが発生しました。運営に問い合わせてください。')
          });
        },
        */
        
      });
 
    };
    
 
  });
  
});
