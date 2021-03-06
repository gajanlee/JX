<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${empty admin_user}">
    <c:redirect url="/index.do">
    </c:redirect>
</c:if>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'main.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="/css/frame.css" />
    <link rel="stylesheet" type="text/css" href="/css/main.css" />
    <link href="/css/font-awesome.min.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.min.js"></script>
</head>

<body>
<div class="container">
    <div id="header">
        <div class="logo">
            <h1>京西商城管理系统</h1>
            <div id="UserInfo">
                <label id="UserLabel">${admin_user.adminName}</label>
                <a id="UButton" href="admin_log_out.do">注销</a>
            </div>
        </div>
    </div>
</div>
<div class="container" id="contentcontainer">
    <div class="aside">

        <!-- Contenedor -->
        <ul id="accordion" class="accordion">



            <li>
                <div class="link">分类管理<i class="fa fa-chevron-down"></i></div>
                <ul class="submenu">
                    <li><a href="parent_category.do" target="IframeMain">一级分类管理</a></li>
                    <li><a href="son_category.do" target="IframeMain">二级分类管理</a></li>
                </ul>
            </li>


            <li>
                <div class="link">商品管理<i class="fa fa-chevron-down"></i></div>
                <ul class="submenu">
                    <li><a href="/admin/good_manager.do" target="IframeMain">商品信息管理</a></li>
                </ul>
            </li>

            <li>
                <div class="link">订单管理<i class="fa fa-chevron-down"></i></div>
                <ul class="submenu">
                    <li><a href="/admin/entry_allorders.do" target="IframeMain">全部订单管理</a></li>
                    <li><a href="/admin/entry_weifahuo.do" target="IframeMain">未发货订单</a></li>
                    <li><a href="/admin/entry_fahuo.do" target="IframeMain">已发货订单</a></li>
                </ul>
            </li>

        </ul>

    </div>
    <div class="content">
        <iframe id="frame" name="IframeMain"></iframe>
    </div>
</div>

<script>
    $(function() {
        var Accordion = function(el, multiple) {
            this.el = el || {};
            this.multiple = multiple || false;

            // Variables privadas
            var links = this.el.find('.link');
            // Evento
            links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
        }

        Accordion.prototype.dropdown = function(e) {
            var $el = e.data.el;
            $this = $(this),
                $next = $this.next();

            $next.slideToggle();
            $this.parent().toggleClass('open');

            if (!e.data.multiple) {
                $el.find('.submenu').not($next).slideUp().parent().removeClass('open');
            };
        }

        var accordion = new Accordion($('#accordion'), false);
    });
    function LoginOut(){
        $.ajax({
            url: '/hotel/servlet/Logout',       //处理测试页面,注意返回内容，成功返回OK
            type:"GET",
            dataType: 'text',
            data: null,
            success: function (msg) {
                msg = msg.replace(/rn/g, '');
                if (msg == "ok") {
                    alert("注销成功");
                    window.location.href="/hotel/manage.jsp";
                }
            }
        });
    }
</script>
</body>
</html>
