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
	<script language="javascript" id="temp">
		document.write('<meta name="viewport" content="width=750, initial-scale=' + window.screen.width / 750 +
			',user-scalable=no, target-densitydpi=device-dpi">');
	</script>
	<link rel="stylesheet" href="{{ mix('css/app.css') }}">
</head>

<body>
	<div id="app">
		<router-view name="loading"></router-view>
		<router-view name="topper"></router-view>
		<router-view name="mainContent"></router-view>
		<router-view name="navigation"></router-view>
		<router-view name="modal"></router-view>
	</div>
	<script src="//res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
	<script src="{{ mix('js/app.js') }}"></script>
</body>

</html>