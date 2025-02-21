<%--
  Created by IntelliJ IDEA.
  User: a1595
  Date: 2025/2/7
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css">
</head>
<body>
<style>
    .demo-login-container {
        width: 320px;
        margin: 21px auto 0;
    }

    .demo-login-other .layui-icon {
        position: relative;
        display: inline-block;
        margin: 0 2px;
        top: 2px;
        font-size: 26px;
    }
</style>

<script src="/static/jquery-2.1.4.js" type="text/javascript" charset="utf-8"></script>
<script src="/static/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="/static/mylayer.js" type="text/javascript" charset="utf-8"></script>

<form id="formId" method="post">
    <div class="demo-login-container">
        <div class="layui-form-item">
            <div class="layui-input-wrap">
                <div class="layui-input-prefix">
                    <i class="layui-icon layui-icon-username"></i>
                </div>
                <input type="text" name="name" value="" lay-verify="required" placeholder="用户名"
                       lay-reqtext="请填写用户名" autocomplete="off" class="layui-input" lay-affix="clear">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-wrap">
                <div class="layui-input-prefix">
                    <i class="layui-icon layui-icon-password"></i>
                </div>
                <input type="text" name="password" value="" lay-verify="required" placeholder="密码"
                       lay-reqtext="请填写密码" autocomplete="off" class="layui-input" lay-affix="clear">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-row">
                <div class="layui-col-xs7">
                    <div class="layui-input-wrap">
                        <div class="layui-input-prefix">
                            <i class="layui-icon layui-icon-vercode"></i>
                        </div>
                        <input type="text" name="code" value="" lay-verify="required" placeholder="验证码"
                               lay-reqtext="请填写验证码" autocomplete="off" class="layui-input" lay-affix="clear">
                    </div>
                </div>
                <div class="layui-col-xs5">
                    <div style="margin-left: 10px;">
                        <img src="/verifyCode"
                             onclick="this.src='/verifyCode?'+ new Date().getTime();">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <button type="button" class="layui-btn layui-btn-fluid" onclick="submitForm()" lay-submit lay-filter="demo-login">登录
            </button>
        </div>
        <div class="layui-form-item">
            <button type="button" class="layui-btn layui-btn-fluid" onclick="registerForm()" lay-submit lay-filter="demo-login">注册
            </button>
        </div>
    </div>

    <%--    用户名:<input type="text" name="name">--%>
    <%--    <br>--%>
    <%--    密码:<input type="password" name="password">--%>
    <%--    <br>--%>
    <%--    验证码:<input type="text" name="code"><img id="verifyCodeId" onclick="refresh()" src="/verifyCode">--%>
    <%--    <br>--%>
    <%--    <input onclick="submitForm()" type="button" value="登录">--%>
</form>

<script>
    function refresh() {
        $('#verifyCodeId').attr('src', '/verifyCode?' + Math.random());
    }

    function submitForm() {
        $.post(
            '/user?method=login',
            $('#formId').serialize(),
            function (result) {
                console.log(result);
                if (result.code == 0) {
                    mylayer.okUrl(result.msg, '/');
                } else {
                    mylayer.errorUrl(result.msg);
                }
            },
            'json'
        );
    }
</script>
</body>
</html>
