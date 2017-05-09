<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
	</head>
	<style>
	    *{margin: 0;padding: 0;}
		body{width: 100%;height: 100vh;background: url(img/bg.jpg) no-repeat;background-size:cover ;
		overflow: hidden;
		}
		
		#head{width: 100%;height: 60px;background: rgba(0,0,0,.2);text-align: center;line-height: 60px;
		font-size: 24px;color: #fff;}
		
		#content{width: 800px; height: 600px;border: 1px solid red; margin: 100px auto 0;
		background: rgba(255,255,255,.5);}
		#content .c_head{width: 100%;height: 60px;background: #4CAF50;}
		#content .c_head .h_img{margin: 0 20px;float: left;}
		#content .c_head .h_span{line-height: 60px;float: left;color: #FFFFFF;font-size: 20px;}
		#content .c_center{width: 100%; height: 420px;}
		#content .c_center .rotWord{width: 100%;margin-top: 10px; overflow: hidden;/*溢出隐藏*/}
		#content .c_center .rotWord span{background:  url(img/rot.png);width: 40px; height: 40px;
		float: left;margin-left: 20px;}
		#content .c_center .rotWord p{max-width: 220px;background: rgba(0,0,255,.5);float: left;
		padding: 10px;border-radius: 10px;margin-left: 10px;}
		#content .c_center .mWord{width: 100%;margin-top: 10px; overflow: hidden;/*溢出隐藏*/}
		#content .c_center .mWord span{background: url(img/my.png);width: 40px;height: 40px;float: right;margin-right: 20px;}
		#content .c_center .mWord p{max-width: 220px;background: rgba(0,0,255,.5);float: right;padding: 10px;border-radius: 
		10px; margin-right: 10px;}
		
		#content .c_footer{width: 760px; height: 60xp;margin: 0 20px;background: #666;}
		#f_left{float: left;width: 620px;height: 60px;outline: none;background: rgba(0,0,0,.1);
		font-size: 18px;border: none; border-radius:5px ;overflow: hidden;text-indent: 10px;}
		#btn{width: 100px;height: 60px; background: #666;float: right;cursor: pointer;
		text-align: center;line-height: 60px;font-size: 18px;-webkit-user-select: none;
		border-radius:10px ; }
		.audio{width: 19px; height: 17px; background: url(img/sound-1.png);position: absolute;bottom: 10px; left:10px;
	           cursor: pointer;}
	    .audio:hover{background: url(img/sound-2.png);}
	</style>
	<body>
		<div id="head">java开发智能客服系统</div>
		
		<div id="content">
			<div class="c_head">
				<img src="img/logo.png" width="80" height="60" alt="" class="h_img"/>
				<span class="h_span">智能客服系统</span>
			</div>
			
			<div class="c_center">
				<!-- <div class="rotWord">
					<span></span>
					<p>您好！</p>
				</div>
				<div class="mWord">
					<span></span>
					<p>您好！</p>
				</div> -->
			</div>
			
			<div class="c_footer">
				<input type="text" name="text" id="f_left" />
				<div id="btn">发送</div>
				 <div class="audio"></div>
			</div>
		</div>
		<script type="text/javascript" src="js/jquery-1.11.1.min.js" ></script>
	<script>
		var text=$("#f_left");
		text.focus();
		function action(){
			if(text.val()==null||text.val()==""){
				text.focus();
				return;
			}
			$(".c_center").append("<div class='mWord'><span></span><p>"+text.val()+"</p></div>");
			$(".c_center").scrollTop(10000000);
			$.ajax({
				type:"post",
				url:"robot",
				data:{"text":text.val()},
				success:function(data){
					//alert(data);
					var result=$.parseJSON(data).text;
					$(".c_center").append("<div class='rotWord'><span></span><p id='member'>"+result+"</p></div>");
					$(".c_center").scrollTop(10000000);
					result=result.replace(/\s+/g,",");//去空格
					//alert(result);
					var url='http:tsn.baidu.com/text2audio?tex='+result+'&lan=zh&cuid=123&ctp=1&tok=24.6b28aa549e8bf1d18e1143d39923e3bf.2592000.1496419719.282335-9600439';
					var obj=$("<audio src='http://tsn.baidu.com/text2audio?tex="+result+"&lan=zh&cuid=123&ctp=1&tok=24.6b28aa549e8bf1d18e1143d39923e3bf.2592000.1496419719.282335-9600439' autoplay='autoplay'></audio>");
				    $("body").remove("audio");
				    $("body").append(obj);
				}
			});
			text.val("");
			text.focus();
		};
		$("#btn").click(function(){
			//alert("发送");
			action();
		});
		$(document).keydown(function(event){
			if(event.keyCode==13){
				//回车
				action();
			}
		});
		
		
	</script>
		
	</body>
</html>