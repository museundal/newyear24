// 목표 날짜 설정 (예시: 2024년 1월 1일)
const targetDate = new Date("2024-01-01");

function updateCountdown() {
    // 현재 한국 시간을 얻어오기
    const now = new Date(new Date().toLocaleString("en-US", { timeZone: "Asia/Seoul" }));

    // 남은 시간 계산
    const timeRemaining = targetDate - now;

    // 시간, 분, 초 계산
    const days = Math.floor(timeRemaining / (1000 * 60 * 60 * 24));
    const hours = Math.floor((timeRemaining % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    const minutes = Math.floor((timeRemaining % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);

    // 결과를 HTML에 업데이트
    const countdownElement = document.getElementById('countdown');
    countdownElement.style.color = 'crimson';
    countdownElement.style.fontWeight = "bold";
    countdownElement.innerHTML = `D-${days} ${hours}시간 ${minutes}분 ${seconds}초`;
}

// 페이지 로드 시에도 업데이트 수행
updateCountdown();

// 1초마다 업데이트
setInterval(updateCountdown, 1000);

// 날짜 기준 카드 오픈 기능
const doors = document.querySelectorAll('.door');
doors.forEach((door, index) => {
  door.addEventListener('click', () => {
    // 모달에 표시할 내용을 설정
    const imageUrl = `image/card/card-${index + 8}.png`;
    const text = modalMessageList[index]['message'];

    // showModal 함수를 호출하여 모달을 표시합니다.
    showModal(imageUrl, text);
  });
});