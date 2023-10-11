<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="zh-tw">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>LPT Store_加入會員</title>

</head>
<body>


	<div class="container-fluid">
		<div class="row">
			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2">新增會員</h1>
					<button id="demoBTN" class="btn btn-warning">DEMO用一鍵輸入</button>
				</div>

				<form action="/LPTStore/CreateMember.do" method="POST"
					enctype="multipart/form-data">
					<div class="mb-3">
						<label for="account" class="form-label">帳號</label> <input
							type="text" class="form-control" id="account" name="account" />
					</div>

					<div class="mb-3">
						<label for="password" class="form-label">密碼</label> <input
							type="text" class="form-control" id="password" name="password" />
					</div>

					<div class="mb-3">
						<label>權限 <select class="form-select" name="level">
								<option value="member">member</option>
								<option value="owner">owner</option>
						</select>
						</label>
					</div>

					<div class="mb-3">
						<label for="mName" class="form-label">姓名</label> <input
							type="text" class="form-control" id="mName" name="mName" />
					</div>

					<div class="mb-3">
						<label for="mPhone" class="form-label">手機號碼</label> <input
							type="number" class="form-control" id="mPhone" name="mPhone" />
					</div>

					<button type="submit" class="btn btn-primary">新增</button>

					<button type="reset" class="w-25 btn btn-lg btn-outline-dark">取消</button>


				</form>
			</main>
		</div>
	</div>
</body>

<script>
	const demoBTN = document.getElementById("demoBTN");
	const mPhotoInput = document.getElementById("mPhotoInput");
	const previewPhotoIMG = document.getElementById("previewPhotoIMG");

	demoBTN.addEventListener("click", function() {
		document.getElementById("account").value = "marryaccount";
		document.getElementById("password").value = "1234";
		document.getElementById("mName").value = "marry";
		document.getElementById("mPhone").value = "0912345678";
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
