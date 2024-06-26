<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
            <h3 class="mb-4">회원 정보</h3>
            <div>
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">
                        이메일
                    </label>
                    <input id="inputEmail" type="text" value="${member.email}" readonly class="form-control">
                </div>
                <div class="mb-3">
                    <label for="inputPassword" class="form-label">
                        비밀번호
                    </label>
                    <input id="inputPassword" type="password" value="${member.password}" readonly class="form-control">
                </div>
                <div class="mb-3">
                    <label for="inputNickName" class="form-label">
                        별명
                    </label>
                    <input id="inputNickName" type="text" value="${member.nickName}" readonly class="form-control">
                </div>
                <div class="mb-3">
                    <label for="inputInserted" class="form-label">
                        가입일시
                    </label>
                    <input id="inputInserted" type="text" value="${member.inserted}" readonly class="form-control">
                </div>

                <sec:authorize access="isAuthenticated()">
                    <sec:authentication property="principal.member" var="authMember"/>
                    <c:if test="${authMember.id == member.id}">
                        <div>
                            <button class="btn btn-secondary" form="formModify">수정</button>
                            <button class="btn btn-danger" form="formDelete">삭제</button>
                        </div>
                    </c:if>
                </sec:authorize>
            </div>


        </div>
    </div>
</div>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.member" var="authMember"/>
    <c:if test="${authMember.id eq member.id}">
        <div>
            <form action="/member/modify" id="formModify">
                <input type="hidden" name="id" value="${member.id}">
            </form>
            <form action="/member/remove" id="formDelete" method="post" onsubmit="return confirm('탈퇴 하시겠습니까?')">
                <input type="hidden" name="id" value="${member.id}">
            </form>
        </div>
    </c:if>
</sec:authorize>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
        integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
