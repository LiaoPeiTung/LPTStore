<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="p-3 mb-3 border-bottom">
	<div class="container">
		<div
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
			<ul
				class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
				<li><a href="/LPTStore/index" class="nav-link px-2 link-secondary">本店首頁</a></li>
				<li><a href="/view/index.jsp" class="nav-link px-2 link-dark">本店商品(未完成)</a></li>
				<li><a href="/LPTStore/competition" class="nav-link px-2 link-dark">賽事資訊</a></li>
				<c:if test="${loggedInMember != null}">
				<li><a href="/LPTStore/profile?mID=${loggedInMember.mID}" class="nav-link px-2 link-dark">會員資訊</a></li>
				</c:if>
			</ul>
			<c:if test="${loggedInMember == null}"> 
				<div class="dropdown text-end">
					<a href="/LPTStore/login">
						<button class="btn btn-primary">會員登入</button>
					</a>
				</div>
			</c:if> 

			<c:if test="${loggedInMember != null}">
				<div class="dropdown text-end">
					<span class="mx-2 fs-4"> ${loggedInMember.mName}</span>
					 <a href="/LPTStore/Logout.do">
						<button class="btn btn-warning">登出</button> 
					</a>
				</div> 
			</c:if>
			 
		</div>
	</div>
</header>