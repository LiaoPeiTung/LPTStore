<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="zh-tw">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>LPT Store_賽事資訊</title>

</head>
<body>

	<jsp:include page="/view/component/header.jsp" />

	<div class="container-fluid">
		<div class="row">
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

				<div align="center">
					<h2>賽事資訊</h2>
					<table border="1">
						<tr style="background-color: #a8fefa">
							<th>賽事編號
							<th>賽事名稱
							<th>參賽費用
							<th>開賽時間
							<th>獎品 
							<c:if test="${loggedInMember != null}">
							<th>報名賽事 
							</c:if>
							<c:if test="${loggedInMember.level == 'owner'}">
							<th>取消賽事
							</c:if>
						<c:forEach items="${cList}" var="c">
						<tr>
							<td>${c.cID}</td>
							<td>${c.cName}</td>
							<td>${c.cFee}</td>
							<td>${c.cTime}</td>
							<td>${c.cReward}</td>
							<c:if test="${loggedInMember != null}">
							<td><a href="/LPTStore/RegisterCompetition.do?mID=${loggedInMember.mID}&cID=${c.cID}" class="nav-link px-2 link-secondary">報名</a></td>
							</c:if>
						<c:if test="${loggedInMember.level == 'owner'}">
							<td><a href="/LPTStore/CancelCompetition.do?cID=${c.cID}" class="nav-link px-2 link-secondary">取消</a></td>
						</c:if>
						</c:forEach>
					</table>
				</div>


				<c:if test="${loggedInMember.level == 'owner'}">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">舉辦賽事</h1>
					<button id="demoBTN" class="btn btn-warning">DEMO用一鍵輸入</button>
				</div>

				<form action="/LPTStore/HoldCompetition.do" method="POST"
					enctype="multipart/form-data">
					<div class="mb-3">
						<label for="cName" class="form-label">賽事名稱</label> <input
							type="text" class="form-control" id="cName" name="cName" />
					</div>

					<div class="mb-3">
						<label for="cFee" class="form-label">參賽費用</label> <input
							type="number" min="0" class="form-control" id="cFee" name="cFee" />
					</div>

					<div class="mb-3">
						<label>開賽時間 <select class="form-select" name="cTime">
								<option value="10:00">10:00</option>
								<option value="14:00">14:00</option>
								<option value="17:00">17:00</option>
								<option value="19:30">19:30</option>
						</select>
						</label>
					</div>

					<div class="mb-3">
						<label for="cReward" class="form-label">獎品</label>
						<textarea cols="40" rows="5" class="form-control" id="cReward"
							name="cReward"></textarea>
					</div>
					<button type="submit" class="btn btn-primary">新增</button>
					<button type="reset" class="w-25 btn btn-lg btn-outline-dark">取消</button>
				</form>
				
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">修改賽事</h1>
				</div>

				<form action="/LPTStore/UpdateCompetition.do" method="POST"
					enctype="multipart/form-data">
					
					<div class="mb-3">
						<label for="cID" class="form-label">賽事編號</label> <input
							type="number" min="0" class="form-control" id="cID" name="cID" />
					</div>
					
					<div class="mb-3">
						<label for="cName" class="form-label">賽事名稱</label> <input
							type="text" class="form-control" id="cName" name="cName" />
					</div>

					<div class="mb-3">
						<label for="cFee" class="form-label">參賽費用</label> <input
							type="number" min="0" class="form-control" id="cFee" name="cFee" />
					</div>

					<div class="mb-3">
						<label>開賽時間 <select class="form-select" name="cTime">
								<option value="10:00">10:00</option>
								<option value="14:00">14:00</option>
								<option value="17:00">17:00</option>
								<option value="19:30">19:30</option>
						</select>
						</label>
					</div>

					<div class="mb-3">
						<label for="cReward" class="form-label">獎品</label>
						<textarea cols="40" rows="5" class="form-control" id="cReward"
							name="cReward"></textarea>
					</div>
					<button type="submit" class="btn btn-primary">修改</button>
					<button type="reset" class="w-25 btn btn-lg btn-outline-dark">取消</button>
				</form>
				
				</c:if>
				
			</main>
		</div>
	</div>

	<jsp:include page="/view/component/footer.jsp" />
</body>

<script>
	const demoBTN = document.getElementById("demoBTN");
	const mPhotoInput = document.getElementById("mPhotoInput");
	const previewPhotoIMG = document.getElementById("previewPhotoIMG");

	demoBTN.addEventListener("click", function() {
		document.getElementById("cName").value = "周一標準賽";
		document.getElementById("cFee").value = "250";
		document.getElementById("cReward").value = "冠軍獲得每月特卡";

	});

	// 預覽圖片
	mPhotoInput.addEventListener("change", function() {
		const file = this.files[0];

		if (!file) {
			previewPhotoIMG.src = "${root}/assets/no_image.png";
			return;
		}

		const tempURL = URL.createObjectURL(file);
		previewPhotoIMG.src = tempURL;
	});

	// 點擊圖片觸發上傳檔案
	previewPhotoIMG.addEventListener("click", function() {
		mPhotoInput.click();
	});
</script>
</html>
