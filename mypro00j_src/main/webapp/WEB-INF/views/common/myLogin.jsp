<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <meta name="description" content="">
    <meta name="author" content=""> -->

    <title>Login</title>

    <!-- Bootstrap Core CSS -->
    <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-primary">
                    <div class="panel-heading">
                        <h2 class="panel-title">Please sign In</h2>
                    </div>
                    <div class="panel-body">
                        <div>
                           <h5 class="text-muted"><c:out value="${error}"/></h5>
                        </div>
                        <form role="form" method='post' action="${contextPath}/myLogin">
                            <fieldset>
                                <h6 class="text-muted"><c:out value="${error}"/></h6>
                                <h6 class="text-muted"><c:out value="${logout}"/></h6>
                            </fieldset>
                       
                            <fieldset>
                                <div class="form-group">
                                    <!-- name 속성을 username으로 지정해야 합니다. -->
                                    <input class="form-control" placeholder="username" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <!-- name 속성을 password로 지정해야 합니다. -->
                                    <input class="form-control" placeholder="Password" name="password" type="password">
                                </div>
                                <div class="checkbox text-primary">
                                    <label for="remember-me">
                                        <!-- security-context.xml의 remember-me 태그에 설정된 remember-me-parameter 속성에 설정된 값(기본값: "remember-me")과 동일해야 함  -->
                                        <input name="remember-me" type="checkbox">
                                        <strong>Remember Me(자동 로그인)</strong>
                                    </label>
                                </div>
                                <div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <div>
                                    <button type='submit' class="btn btn-lg btn-success btn-block">Sign in</button>
                                </div>
                            </fieldset>
                            <fieldset>
                                <hr>
                                <h6 class="text-muted text-center"><c:out value="${normal}"/></h6>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${contextPath}/resources/dist/js/sb-admin-2.js"></script>
</body>
</html>
