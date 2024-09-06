document.addEventListener("DOMContentLoaded", function() {
    //쿠키 여부 확인
    const cookie = document.cookie;
    console.log("내가 만든 cookie {}:", cookie);
    roleCheck(cookie);
});

// 자격 검증
const roleCheck = (cookie) => {
    const url = "/role"
    fetch(url, {
        method: "POST",

    })
    .then(response =>{
        console.log("response {}:" , response);
    })
}
