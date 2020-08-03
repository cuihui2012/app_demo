<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/pages/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>用户登录--这是一个测试</title>

    <link rel="shortcut icon" type="image/x-icon" href="${ctx}/images/favicon.ico" />

    <link rel="stylesheet" href="${ctx}/common/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${ctx}/css/login.css" media="all" />
    <script>  
        var ctx = "${ctx}";
    </script>
    <script type="text/javascript">
        if(window !=top){
            top.location.href=location.href;
        }
    </script>
</head>
<body>


<div class="video_mask"></div>
<div class="login">
    <h1>用户登录</h1>
    <form class="layui-form" id="form">
        <div class="layui-form-item">
            <input class="layui-input" name="username" placeholder="用户名" value="admin" lay-verify="required" type="text" autocomplete="off">
        </div>
        <div class="layui-form-item">
            <input class="layui-input" name="password" placeholder="密码" value="123456"  lay-verify="required" type="password" autocomplete="off">
        </div>
        <div class="layui-form-item form_code">
            <input class="layui-input" style="width: 140px;" name="vcode" placeholder="验证码" lay-verify="required" type="text" autocomplete="off" maxlength="4">
            <div class="code"><img id="captcha" src="${ctx}/vcode" width="100" height="36" onclick="refreshCode(this)"></div>
        </div>
        <div class="layui-form-item" style="margin-left: 35px;">
            <label class="layui-form-label" style="color: white;">记住我</label>
            <div class="layui-input-block">
                <input type="checkbox" name="rememberMe" value="1" lay-skin="primary">
            </div>
        </div>
        <button class="layui-btn login_btn" lay-submit="" lay-filter="login" id="btn">登录</button>
    </form>
    <a class="forgetP"  href="#" onclick="forgetUserPwd()">忘记密码</a>
</div>
<script type="text/javascript" src="${ctx}/common/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/js/login.js"></script>
</body>
</html>