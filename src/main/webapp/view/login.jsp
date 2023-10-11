<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LPT Store-登入</title>


<body class="vh-100">
	
	
	<main class="form-signin m-5 text-center ">
		<form action="/LPTStore/Login.do" method="post">
			<h1 class="h3 mb-3 fw-normal">會員登入</h1>
			<div class="form-floating">
				<input type="text" class="form-control" placeholder="Account"
					id="account" name="account" required> <label>帳號</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control" id="password"
					placeholder="Password" name="password" required> <label>密碼</label>
			</div>
			
			<div class="mb-2">
				<button type="submit" class="w-25 btn btn-lg btn-primary">登入</button>
			</div>
			<div>

				<button type="reset" class="w-25 btn btn-lg btn-outline-dark" id="cancelBTN">取消</button>

			</div>
			<div class="mt-5" style="color: red">${message}</div>
		</form>
	</main>

	<div class="text-center m-5">
		快速登入:
		<button class="btn btn-outline-info fastLogin">LPT(管理員)</button>
	</div>
	
	<div class="text-center m-5">
		<a href="/LPTStore/createmember" class="nav-link px-2 link-secondary">加入會員</a>
	</div>

</body>

<script type="text/javascript">
	const fastLoginBTNs = document.querySelectorAll(".fastLogin");
	const emailInput = document.querySelector("#account");
	const passwordInput = document.querySelector("#password");
	

	//快速登入
	fastLoginBTNs.forEach(button=>{
		button.addEventListener("click",function(){
			if(this.innerHTML=="LPT(管理員)"){
				emailInput.value="lptstore";
			}
			passwordInput.value=1234;
		})
	})

	 
	
	
    // 如果是通過 "返回上一頁" 的方式進入此頁面，且cookie中有登入的flag，則使用 location.replace() 將頁面導回首頁。
    if (performance.navigation.type == 2 && document.cookie) {
        location.replace("index");
    }
	
</script>

</html>