// <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
// <script src="/snsshare.js"></script>
//
// $(document).ready(function(){
//   $('.more').click(function(){
//     if($('.more').hasClass('more')){
//        $('.more').addClass('close').removeClass('more');
//     }else if($('.close').hasClass('close')){
//        $('.close').addClass('more').removeClass('close');
//     }
//   });
// });

var hostname = "210.89.181.131:3000";
var pahtname = "/audio_sample/2.mp4";

//카카오톡 sdk 모듈
//참고 : https://developers.kakao.com/docs/js
// 카카오톡 버튼 초기화
function kakao_share_button_init() {
    console.log(startTime);

    // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
        container: '#kakao-link-btn',
        objectType: 'feed',
        content: {
          title: '팥빵 공유',
          description: '#구간공유',
          imageUrl: 'http://www.venturesquare.net/wp-content/uploads/2017/03/170310-podbbang.-002.png',
          link: {
            mobileWebUrl: 'http://' + hostname + pathname + '?startTime='+ startTime +'&endTime='+ endTime,
            webUrl: 'http://' + hostname + pathname + '?startTime='+ startTime +'&endTime='+ endTime,
          }
        },

        //성공 시
        success: function(authObj) {
          alert(JSON.stringify(authObj));
        },
        //실패 시
        fail: function(err) {
          alert(JSON.stringify(err));
        }
    });
}

// 페이스북 공유 링크 함수
function facebook_share_button_link() {
    var hostname = window.location.hostname;
    var pathname = window.location.pathname;
    console.log('https://www.facebook.com/sharer/sharer.php?u=http://' + hostname + pathname + '?startTime='+ startTime +'&endTime='+ endTime);
    window.open('https://www.facebook.com/sharer/sharer.php?u=http://' + hostname + pathname + '?startTime='+ startTime +'&endTime='+ endTime, '_blank');
}

function sns_toggle()
{

}
