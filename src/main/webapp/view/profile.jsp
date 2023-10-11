<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>LPT Store-個人資料</title>


<style>
.xmark {
	top: 10%;
	right: 7%;
}

.xmark-hide {
	display: none;
}
</style>
</head>

<body>
	<jsp:include page="/view/component/header.jsp" />

	<main>
		<div class="container py-5">
			<div class="row">
				<div class="col-lg-4">
					<div class="card mb-4">
						<div class="card-body text-center">
							<h2 class="my-3">${loggedInMember.mName }</h2>
						</div>
					</div>
					<div class="card mb-4 mb-lg-0">
						<div class="card mb-4">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Account</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${loggedInMember.account }</p>
									</div>
								</div>
								<hr />
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">權限</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${loggedInMember.level }</p>
									</div>
								</div>
								<hr />
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">電話</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${loggedInMember.mPhone }</p>
									</div>
								</div>
								<hr />
								
							</div>
						</div>
					</div>
					
					<div align="center">
					<h2>已報名賽事</h2>
					<table border="1">
						<tr style="background-color: #a8fefa">
							<th>賽事編號
							<th>賽事名稱
							<th>參賽費用
							<th>開賽時間
							<th>獎品 
						<c:forEach items="${cList}" var="c">
						<tr>
							<td>${c.cID}</td>
							<td>${c.cName}</td>
							<td>${c.cFee}</td>
							<td>${c.cTime}</td>
							<td>${c.cReward}</td>
						</c:forEach>
					</table>
				</div>
					
					
				</div>
				
			</div>
		</div>
	</main>

	<jsp:include page="/view/component/footer.jsp" />
</body>

</html>
