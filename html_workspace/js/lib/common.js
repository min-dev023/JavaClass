// 원하는 정수를 반환받ㄷ기 위해서는 n값을 호출시 결정하자
// ex) getRandom(1001)dmf sjarlaus 0~1000 반환
// ex) getRandom(901)을 넘기면 0~900 반환
// function getRandom(n) {
//     return parseInt(Math.random() * n);
// }

function getRandom(max) {
    return parseInt(Math.random() * (max + 1)); // 0보다 크고 1보다 작은 난수
}