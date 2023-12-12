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
  { "number": 23, "message": "12월의 특별한 순간, 행복이 퍼져나가길." },
  { "number": 24, "message": "모두에게 행복한 24일이 될 것을 기대합니다!" },
  { "number": 25, "message": "12월, 행복이 가득찬 마음으로 채워져 있는 시간." },
  { "number": 26, "message": "다양한 행복이 모여 하나로 뭉쳐지는 24일!" },
  { "number": 27, "message": "12월, 당신과 나누는 특별한 행복의 순간들." },
  { "number": 28, "message": "모두에게 다가오는 24일, 행복이 함께하기를!" },
  { "number": 29, "message": "12월의 행복한 기운이 모두를 감싸네요." },
  { "number": 30, "message": "다 함께하는 24일, 행복한 느낌이 가득할 거예요." },
  { "number": 31, "message": "12월, 모두에게 기쁨과 행복이 넘치는 달이에요." }
];