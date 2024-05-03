<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css"
          integrity="sha512-jnSuA4Ss2PkkikSOLtYs8BlYIeeIK1h99ty4YfvRPAlzr377vr3CXDb7sb7eEEBYjDtcYj+AjBH3FLv5uSJuXg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>

<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-6">
            <h3 class="mb-4">회원 정보 수정</h3>
            <form action="/member/modify" method="post" onsubmit="return checkValues()">
                <input type="hidden" name="id" value="${member.id}">
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">
                        이메일
                    </label>
                    <input id="inputEmail" type="text" name="email" value="${member.email}"
                           class="form-control-plaintext">
                </div>
                <div class="mb-3">
                    <label for="inputPassword" class="form-label">
                        암호
                    </label>
                    <input oninput="passwordCheck()" id="inputPassword" type="password" name="password"
                           value=""
                           class="form-control">
                    <div class="form-text">
                        암호를 입력하지 않으면 기존 암호로 유지됩니다.
                    </div>
                </div>
                <div class="mb-3">
                    <label for="inputPasswordCheck" class="form-label">
                        암호 확인
                    </label>
                    <input oninput="passwordCheck()" id="inputPasswordCheck" type="password"
                           value=""
                           class="form-control">
                    <div class="form-text" id="passwordMessage"></div>
                </div>
                <div class="mb-3">
                    <label for="inputNickName" class="form-label">
                        별명
                    </label>
                    <div class="input-group">
                        <input id="inputNickName" type="text" name="nickName" value="${member.nickName}"
                               class="form-control">
                        <button onclick="nickNameCheck()" class="btn btn-outline-secondary" type="button">중복확인</button>
                    </div>
                </div>
                <div>
                    <button class="btn btn-secondary">수정</button>
                </div>
            </form>


        </div>
    </div>
</div>

<script>
    // let check1 = false;
    // let check2 = false;
    //
    // async function nickNameCheck() {
    //     const nickNameValue = document.querySelector("#inputNickName").value;
    //     const url = "/member/nickName?nickName=" + nickNameValue;
    //
    //     fetch(url)
    //         .then()
    //
    //     // 1 이면 사용 가능 별명, 0이면 불가능
    //     if (response == 0) {
    //         alert("사용 가능 별명 입니다.")
    //         check2 = true;
    //     } else {
    //         alert("사용 불가능 별명 입니다.")
    //         check2 = false;
    //     }
    //
    // }

    function passwordCheck() {
        const password = document.querySelector("#inputPassword").value;
        const passwordCheck = document.querySelector("#inputPasswordCheck").value;

        if (password != passwordCheck) {
            document.querySelector("#passwordMessage").textContent = "패스워드가 다릅니다."
            // check1 = false
        } else {
            document.querySelector("#passwordMessage").textContent = ""
            // check1 = true;
        }
    }

    function checkValues() {

        const password = document.querySelector("#inputPassword").value;
        const passwordCheck = document.querySelector("#inputPasswordCheck").value;

        if (password != null && password == passwordCheck) {
            return true;
        } else {
            alert("정보를 다시 확인해주세요");
            return false;
        }
    }
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
