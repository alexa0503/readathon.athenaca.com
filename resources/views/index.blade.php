<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="format-detection" content="telephone=no" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<title>{{config('app.name')}}</title>
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<meta name="csrf-token" content="{{ csrf_token() }}">
	<link rel="stylesheet" href="{{ mix('css/app.css') }}">
</head>

<body>
	<div class="loading">
		<div class="main-content">
			<img src="/images/icon-logo.png" class="img-fluid" width="100" />
		</div>
	</div>
	<div id="app">
		<router-view name="topper"></router-view>
		<router-view name="mainContent"></router-view>
		<router-view name="navigation"></router-view>
		<router-view name="modal"></router-view>
	</div>
	<script src="//res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<script src="{{ mix('js/app.js') }}"></script>
	<script>
		var windowInnerHeight = window.innerHeight; //获取当前浏览器窗口高度
		if (window.orientation == 0) {
			$(window).resize(function () {
				if (window.innerHeight < windowInnerHeight) {
					$('#navigation').removeClass('fixed-bottom');
					$('#profileBtn').removeClass('fixed-bottom');
				} else {
					$('#navigation').addClass('fixed-bottom');
					$('#profileBtn').addClass('fixed-bottom');
				}
			});
		}
	</script>
</body>

</html>