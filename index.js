// 모달을 생성하고 설정하는 함수
function showModal(imageUrl, text) {
  // 기존에 모달이 있다면 제거합니다.
  const existingModal = document.querySelector('.modal');
  if (existingModal) {
    existingModal.remove();
  }

  // 모달 요소를 생성합니다.
  const modal = document.createElement('div');
  modal.className = 'modal hidden';

  // 모달 내용을 담는 컨테이너를 생성합니다.
  const modalContent = document.createElement('div');
  modalContent.className = 'modal-content zoomIn';

  // 이미지를 표시할 요소를 생성합니다.
  const image = document.createElement('div');
  image.style.backgroundImage = `url(${imageUrl})`;
  image.alt = 'Door Image';
  image.style.width = '100%';
  image.style.height = '211px';

  // 텍스트를 표시할 요소를 생성합니다.
  const textElement = document.createElement('p');
  textElement.textContent = text;

  // 모달 컨텐트에 이미지와 텍스트를 추가합니다.
  modalContent.appendChild(image);
  modalContent.appendChild(textElement);

  // 모달에 모달 컨텐트를 추가합니다.
  modal.appendChild(modalContent);

  // 모달에 클릭 이벤트 리스너를 추가하여 닫을 수 있도록 합니다.
  modal.addEventListener('click', () => {
    modal.remove(); // 모달을 문서에서 제거합니다.
  });

  // 문서에 모달을 추가합니다.
  document.body.appendChild(modal);
  // 모달을 표시합니다.
  setTimeout(() => modal.classList.remove('hidden'), 0);

  
}

const today = new Date();
const currentDay = today.getDate();
document.querySelectorAll('.door').forEach((door, index) => {
    const doorDay = index + 8; // 각 '문'이 나타내는 날짜

    // 클릭 이벤트 리스너 추가
    door.addEventListener('click', (e) => {
        if (doorDay > currentDay) {
            // 현재 날짜보다 미래 날짜인 경우 이벤트 방지
            e.preventDefault();
            return; // 이벤트 핸들러 종료
        }

    });
});


const modalMessageList = [
  { "number": 8, "message": "주머니에 3천원,,아니 6천원은 넣아야하는 계절" },
  { "number": 9, "message": "짭식이라도 사랑해주나요💛." },
  { "number": 10, "message": "당신은 꼬미의 행운빔을 받았습니다🍀" },
  { "number": 11, "message": "월요병 노을로 이겨내기👊👊" },
  { "number": 12, "message": "마 ! 전두광이" },
  { "number": 13, "message": "암 굿 암 그뤠잇 좋아 나는 멋져🔑" },
  { "number": 14, "message": "오늘은 허그데이! (토닥토닥)" },
  { "number": 15, "message": "국제귀여움협회를 뒤집어놓으셔따" },
  { "number": 16, "message": "나는멋지다,나는짱이다,나는 베리굿이다! 3번 외치기" },
  { "number": 17, "message": "오늘의 점심은 짜파게티에 파김치에 계란후라이🍳" },
  { "number": 18, "message": "거친세상에뛰어든건나니까 암오케" },
  { "number": 19, "message": "화요일의 꽃말은? 왜아화🤷‍♀️" },
  { "number": 20, "message": "꺾여도 그냥 하는 마음! " },
  { "number": 21, "message": "주말권에 진입했어요🌠." },
  { "number": 22, "message": "오늘 딱 한잔만 먹기🍺" },
  { "number": 23, "message": "들숨의 재력 날숨에 건강을!　　 빨리 쉬면 효과 ✌배" },
  { "number": 24, "message": "뒤쪽 레이디께서 보내신 케이크입니다(이용대짤)" },
  { "number": 25, "message": "메리 크리스마스! 작년보다 더 헹복한 하루 보내요🎄" },
  { "number": 26, "message": "전세개가 날 주목해😎" },
  { "number": 27, "message": "많이 웃어주시고 박수도 주시고 감사합니다" },
  { "number": 28, "message": "건강해지고 싶다면 녹색음식을 많이 먹으세요" },
  { "number": 29, "message": "전 열한살입니다." },
  { "number": 30, "message": "32일이라고..33일이라고.." },
  { "number": 31, "message": "다가오는 한 해를 맞이하기 위해 오늘은 푹 쉬세요! 23년도 수고했습니다🐰 " }
];