$(function() {
	window.onload = function() {
		init();
		search();
		getTime();
		setInterval(getTime, 1000);
	}
	var $iframe = $("#iframe");
	var $time = $("#banner .banner-time");
	//预订、入住、退房等等
	var $search = $("#banner .search");
	//视图查询
	var $view = $("#banner .view");
	//各种查询
	var $find = $("#banner .find");

	//初始化事件
	function init() {
		$search.on('click', function(event) {
			event.preventDefault();
			$("#banner .find .searchBtn").stop(true, true).slideUp(400);
			$("#banner .search .searchBtn").stop(true, true).slideToggle(400);
		});
	}
	//获取系统当前时间
	function getTime() {
		var date = new Date();
		var time = date.toString().split(" ");
		var formatTime = time[3] + "年" + (date.getMonth() + 1) + "月" + time[2] + "日" + time[4];
		$time.text(formatTime);
	}
	//点击菜单栏 跳转相应的页面
	function search() {
		//点击入房退房等等
		var $searchBtn = $("#banner .search .searchBtn");
		$searchBtn.on('click', '.content', function(event) {
			var className = $(this).attr('class');
			console.log(className);
			var page = className.split(' ')[1];
			console.log(page);
			$iframe.attr('src', page + ".jsp");
		});
		//点击视图查询，跳转相应的页面
		$view.on('click', function(event) {
			$iframe.attr('src', "showView.jsp");
		});
		$find.on('click', function(event) {
			$iframe.attr('src', "searchInfo.jsp");
		});
	}
});