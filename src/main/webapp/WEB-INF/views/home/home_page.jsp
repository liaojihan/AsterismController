<%--
  Created by IntelliJ IDEA.
  User: LJH
  Date: 2017/11/21
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path=request.getContextPath();
    session.setAttribute("path", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path);
%>
<!-- FlatFy Theme - Andrea Galanti /-->
<!doctype html>
<!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
<!--[if IE 9]>    <html class="no-js ie9" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="Flatfy Free Flat and Responsive HTML5 Template ">
    <meta name="author" content="">

    <title>Flatfy – Free Flat and Responsive HTML5 Template</title>

    <!-- Bootstrap core CSS -->
    <link href="${path}/FlatfyTheme/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Google Web Font -->
    <link href="${path}/FlatfyTheme/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href='${path}/FlatfyTheme/css/family-lato.css' rel='stylesheet' type='text/css'>
    <link href='${path}/FlatfyTheme/css/family-arvo.css' rel='stylesheet' type='text/css'>

    <!-- Custom CSS-->
    <link href="${path}/FlatfyTheme/css/general.css" rel="stylesheet">

    <!-- Owl-Carousel -->
    <link href="${path}/FlatfyTheme/css/custom.css" rel="stylesheet">
    <link href="${path}/FlatfyTheme/css/owl.carousel.css" rel="stylesheet">
    <link href="${path}/FlatfyTheme/css/owl.theme.css" rel="stylesheet">
    <link href="${path}/FlatfyTheme/css/style.css" rel="stylesheet">
    <link href="${path}/FlatfyTheme/css/animate.css" rel="stylesheet">

    <!-- Magnific Popup core CSS file -->
    <link rel="stylesheet" href="${path}/FlatfyTheme/css/magnific-popup.css">

    <script src="${path}/FlatfyTheme/js/modernizr-2.6.2.min.js"></script>  <!-- Modernizr /-->
</head>

<body id="home">

<!-- Preloader -->
<div id="preloader">
    <div id="status"></div>
</div>

<!-- FullScreen -->
<div class="intro-header">
    <div class="col-xs-12 text-center abcen1">
        <h1 class="h1_home wow fadeIn" data-wow-delay="0.4s">WOW</h1>
        <h3 class="h3_home wow fadeIn" data-wow-delay="0.6s">Ansu & Asterism</h3>
        <ul class="list-inline intro-social-buttons">
            <%--<li><a href="#" class="btn  btn-lg mybutton_cyano wow fadeIn" data-wow-delay="0.8s" id="wechat"><span class="network-name">Wechat</span></a>--%>
            <%--</li>--%>
            <li id="download" ><a href="#contact" class="btn  btn-lg mybutton_standard wow swing wow fadeIn" data-wow-delay="1.2s"><span class="network-name">Join Us</span></a>
            </li>
        </ul>
    </div>
    <!-- /.container -->
    <div class="col-xs-12 text-center abcen wow fadeIn">
        <div class="button_down ">
            <a class="imgcircle wow bounceInUp" data-wow-duration="1.5s"  href="#whatis"> <img class="img_scroll" src="${path}/FlatfyTheme/img/icon/circle.png" alt=""> </a>
        </div>
    </div>
</div>

<!-- NavBar-->
<nav class="navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#home">Asterism</a>
        </div>

        <div class="collapse navbar-collapse navbar-right navbar-ex1-collapse">
            <ul class="nav navbar-nav">

                <li class="menuItem"><a href="#whatis">关于我们</a></li>
                <li class="menuItem"><a href="#useit">交流分享</a></li>
                <li class="menuItem"><a href="#screen">公会热榜</a></li>
                <li class="menuItem"><a href="#credits">副本进度</a></li>
                <li class="menuItem"><a href="#contact">加入我们</a></li>
            </ul>
        </div>

    </div>
</nav>

<!-- What is -->
<div id="whatis" class="content-section-b" style="border-top: 0">
    <div class="container">

        <div class="col-md-6 col-md-offset-3 text-center wrap_title">
            <h2>关于我们</h2>
            <p class="lead" style="margin-top:0">A marvelous guild</p>

        </div>

        <div class="row">

            <div class="col-sm-4 wow fadeInDown text-center">
                <h3>为了联盟</h3>
                <p class="lead"><br><br>我们是国服十区 -- 安苏服务器的一家联盟公会！</p>

                <!-- <p><a class="btn btn-embossed btn-primary view" role="button">View Details</a></p> -->
            </div><!-- /.col-lg-4 -->

            <div class="col-sm-4 wow fadeInDown text-center">
                <h3>公会背景</h3>
                <p class="lead">其实往回看看，事情总是发生的让人出乎意料不是吗？
                    谁能想到当初只有10个人的团队，之后可以坚持4年多还在一起谈笑风生呢。
                    公会最早追溯到90年代初期。当时只是10个人的固定团，并没有在一个公会。
                    在7.0初期，人员开始陆陆续续的更换与增多，才能组建起这个强壮的新团队。</p>
                <!-- <p><a class="btn btn-embossed btn-primary view" role="button">View Details</a></p> -->
            </div><!-- /.col-lg-4 -->

            <div class="col-sm-4 wow fadeInDown text-center">
                <h3>公会进度</h3>
                <p class="lead"><br>现在由一区诺莫瑞根转服至十区安苏重现组建公会。
                    目前王座7M开荒金加洛斯，招募稳定并有一定装备基础，能合理安排生活与活动时间的成熟团员</p>
                <!-- <p><a class="btn btn-embossed btn-primary view" role="button">View Details</a></p> -->
            </div><!-- /.col-lg-4 -->

        </div><!-- /.row -->

        <div class="row tworow">

            <div class="col-sm-4  wow fadeInDown text-center">
                <h3>公会活动</h3>
                <p class="lead"></p>
                <p class="lead"><span style="font-weight: bold">活动时间:</span>每周活动时间为 周5，周6，周日晚上7:50-11:00</p>
                <p class="lead"><span style="font-weight: bold">分配模式:</span>分配模式目前是队长分配，绝对不用担心黑装备问题，目前团队非常和谐，大家都在让来让去，没有出现争抢的情况。</p>
                <!-- <p><a class="btn btn-embossed btn-primary view" role="button">View Details</a></p> -->
            </div><!-- /.col-lg-4 -->

            <div class="col-sm-4 wow fadeInDown text-center">
                <h3>联系方式</h3>
                <p class="lead">微信:15177777340 -- 碧水</p>
                <p class="lead">请标注NGA招募 </p>
                <p class="lead">游戏联系方式: 碧水丶-安苏</p>
                <p class="lead">战网: vv5616561@163.com</p>
                <!-- <p><a class="btn btn-embossed btn-primary view" role="button">View Details</a></p> -->
            </div><!-- /.col-lg-4 -->

            <div class="col-sm-4 wow fadeInDown text-center">
                <h3>题外话</h3>
                <p class="lead">本人其实挺怀念在这4年多来在团里的每一个人，因为大家都为这个团队付出了努力才会有今天。
                    我甚至还记得当时每个人的ID，每当在好友列表里看到那个灰色的名字的时候，小心脏还是会淡淡触抖一下。
                    或许真的是每个人都有有些怀旧情结吧，重要的就是就算是一个又一个版本的结束，但每当一个新版本出现时，大家也还可以一起像以前一样游戏才是最快乐的。
                    我们不只是为了某一个版本的Raid通关而招募，更重要的是认识更多的朋友一起愉快的玩耍！
                    <s>就我矫情。</s>
                    </p>
                <!-- <p><a class="btn btn-embossed btn-primary view" role="button">View Details</a></p> -->
            </div><!-- /.col-lg-4 -->

        </div><!-- /.row -->
    </div>
</div>

<!-- Use it -->
<div id ="useit" class="content-section-a">

    <div class="container">

        <div class="row">

            <div class="col-sm-6 pull-right wow fadeInRightBig">
                <img class="img-responsive " src="${path}/FlatfyTheme/img/ipad.png" alt="">
            </div>

            <div class="col-sm-6 wow fadeInLeftBig"  data-animation-delay="200">
                <h3 class="section-heading">交流分享</h3>
                <div class="sub-title lead3">Lorem ipsum dolor sit atmet sit dolor greand fdanrh<br> sdfs sit atmet sit dolor greand fdanrh sdfs</div>
                <p class="lead">
                    In his igitur partibus duabus nihil erat, quod Zeno commuta rest gestiret.
                    Sed virtutem ipsam inchoavit, nihil ampliusuma. Scien tiam pollicentur,
                    uam non erat mirum sapientiae lorem cupido
                    patria esse cariorem. Quae qui non vident, nihilamane umquam magnum ac cognitione.
                </p>

                <p><a class="btn btn-embossed btn-primary" href="#" role="button">View Details</a>
                    <a class="btn btn-embossed btn-info" href="#" role="button">Visit Website</a></p>
            </div>
        </div>
    </div>
    <!-- /.container -->
</div>

<div class="content-section-b">

    <div class="container">
        <div class="row">
            <div class="col-sm-6 wow fadeInLeftBig">
                <div id="owl-demo-1" class="owl-carousel">
                    <a href="${path}/FlatfyTheme/img/iphone.png" class="image-link">
                        <div class="item">
                            <img class="img-responsive img-rounded" src="${path}/FlatfyTheme/img/iphone.png" alt="">
                        </div>
                    </a>
                    <a href="${path}/FlatfyTheme/img/iphone.png" class="image-link">
                        <div class="item">
                            <img class="img-responsive img-rounded" src="${path}/FlatfyTheme/img/iphone.png" alt="">
                        </div>
                    </a>
                    <a href="${path}/FlatfyTheme/img/iphone.png" class="image-link">
                        <div class="item">
                            <img class="img-responsive img-rounded" src="${path}/FlatfyTheme/img/iphone.png" alt="">
                        </div>
                    </a>
                </div>
            </div>

            <div class="col-sm-6 wow fadeInRightBig"  data-animation-delay="200">
                <h3 class="section-heading">Drag Gallery</h3>
                <div class="sub-title lead3">Lorem ipsum dolor sit atmet sit dolor greand fdanrh<br> sdfs sit atmet sit dolor greand fdanrh sdfs</div>
                <p class="lead">
                    In his igitur partibus duabus nihil erat, quod Zeno commuta rest gestiret.
                    Sed virtutem ipsam inchoavit, nihil ampliusuma. Scien tiam pollicentur,
                    uam non erat mirum sapientiae lorem cupido
                    patria esse cariorem. Quae qui non vident, nihilamane umquam magnum ac cognitione.
                </p>

                <p><a class="btn btn-embossed btn-primary" href="#" role="button">View Details</a>
                    <a class="btn btn-embossed btn-info" href="#" role="button">Visit Website</a></p>
            </div>
        </div>
    </div>
</div>

<%--<div class="content-section-a">--%>

    <%--<div class="container">--%>

        <%--<div class="row">--%>

            <%--<div class="col-sm-6 pull-right wow fadeInRightBig">--%>
                <%--<img class="img-responsive " src="${path}/FlatfyTheme/img/doge.png" alt="">--%>
            <%--</div>--%>

            <%--<div class="col-sm-6 wow fadeInLeftBig"  data-animation-delay="200">--%>
                <%--<h3 class="section-heading">Font Awesome & Glyphicon</h3>--%>
                <%--<p class="lead">A special thanks to Death to the Stock Photo for--%>
                    <%--providing the photographs that you see in this template.--%>
                <%--</p>--%>

                <%--<ul class="descp lead2">--%>
                    <%--<li><i class="glyphicon glyphicon-signal"></i> Reliable and Secure Platform</li>--%>
                    <%--<li><i class="glyphicon glyphicon-refresh"></i> Everything is perfectly orgainized for future</li>--%>
                    <%--<li><i class="glyphicon glyphicon-headphones"></i> Attach large file easily</li>--%>
                <%--</ul>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>

<%--</div>--%>

<!-- Screenshot -->
<div id="screen" class="content-section-b">
    <div class="container">
        <div class="row" >
            <div class="col-md-6 col-md-offset-3 text-center wrap_title ">
                <h2>Screen App</h2>
                <p class="lead" style="margin-top:0">A special thanks to Death.</p>
            </div>
        </div>
        <div class="row wow bounceInUp" >
            <div id="owl-demo" class="owl-carousel">

                <a href="${path}/FlatfyTheme/img/slide/1.png" class="image-link">
                    <div class="item">
                        <img class="img-responsive img-rounded" src="${path}/FlatfyTheme/img/slide/1.png" alt="Owl Image">
                    </div>
                </a>

                <a href="${path}/FlatfyTheme/img/slide/2.png" class="image-link">
                    <div class="item">
                        <img class="img-responsive img-rounded" src="${path}/FlatfyTheme/img/slide/2.png" alt="Owl Image">
                    </div>
                </a>

                <a href="${path}/FlatfyTheme/img/slide/3.png" class="image-link">
                    <div class="item">
                        <img class="img-responsive img-rounded" src="${path}/FlatfyTheme/img/slide/3.png" alt="Owl Image">
                    </div>
                </a>

                <a href="${path}/FlatfyTheme/img/slide/1.png" class="image-link">
                    <div class="item">
                        <img class="img-responsive img-rounded" src="${path}/FlatfyTheme/img/slide/1.png" alt="Owl Image">
                    </div>
                </a>

                <a href="${path}/FlatfyTheme/img/slide/2.png" class="image-link">
                    <div class="item">
                        <img class="img-responsive img-rounded" src="${path}/FlatfyTheme/img/slide/2.png" alt="Owl Image">
                    </div>
                </a>

                <a href="${path}/FlatfyTheme/img/slide/3.png" class="image-link">
                    <div class="item">
                        <img class="img-responsive img-rounded" src="${path}/FlatfyTheme/img/slide/3.png" alt="Owl Image">
                    </div>
                </a>
            </div>
        </div>
    </div>


</div>

<div  class="content-section-c ">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3 text-center wrap_title white">
                <h2>Get Live Updates</h2>
                <p class="lead" style="margin-top:0">A special thanks to Death.</p>
            </div>
            <div class="mockup-content">
                <div class="morph-button wow pulse morph-button-inflow morph-button-inflow-1">
                    <button type="button "><span>Subscribe to our Newsletter</span></button>
                    <div class="morph-content">
                        <div>
                            <div class="content-style-form content-style-form-4 ">
                                <h2 class="morph-clone">Subscribe to our Newsletter</h2>
                                <form>
                                    <p><label>Your Email Address</label><input type="text"/></p>
                                    <p><button>Subscribe me</button></p>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Credits -->
<div id="credits" class="content-section-a">
    <div class="container">
        <div class="row">

            <div class="col-md-6 col-md-offset-3 text-center wrap_title">
                <h2>Credits</h2>
                <p class="lead" style="margin-top:0">A special thanks to Death.</p>
            </div>

            <div class="col-sm-6  block wow bounceIn">
                <div class="row">
                    <div class="col-md-4 box-icon rotate">
                        <i class="fa fa-desktop fa-4x "> </i>
                    </div>
                    <div class="col-md-8 box-ct">
                        <h3> Bootstrap </h3>
                        <p> Lorem ipsum dolor sit ametconsectetur adipiscing elit. Suspendisse orci quam. </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 block wow bounceIn">
                <div class="row">
                    <div class="col-md-4 box-icon rotate">
                        <i class="fa fa-picture-o fa-4x "> </i>
                    </div>
                    <div class="col-md-8 box-ct">
                        <h3> Owl-Carousel </h3>
                        <p> Nullam mo  arcu ac molestie scelerisqu vulputate, molestie ligula gravida, tempus ipsum.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row tworow">
            <div class="col-sm-6  block wow bounceIn">
                <div class="row">
                    <div class="col-md-4 box-icon rotate">
                        <i class="fa fa-magic fa-4x "> </i>
                    </div>
                    <div class="col-md-8 box-ct">
                        <h3> Codrops </h3>
                        <p> Lorem ipsum dolor sit ametconsectetur adipiscing elit. Suspendisse orci quam. </p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 block wow bounceIn">
                <div class="row">
                    <div class="col-md-4 box-icon rotate">
                        <i class="fa fa-heart fa-4x "> </i>
                    </div>
                    <div class="col-md-8 box-ct">
                        <h3> Lorem Ipsum</h3>
                        <p> Nullam mo  arcu ac molestie scelerisqu vulputate, molestie ligula gravida, tempus ipsum.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<!-- Banner Download -->--%>
<%--<div id="downloadlink" class="banner">--%>
    <%--<div class="container">--%>
        <%--<div class="row">--%>
            <%--<div class="col-md-6 col-md-offset-3 text-center wrap_title">--%>
                <%--<h2>Download Free</h2>--%>
                <%--<p class="lead" style="margin-top:0">Pay with a Tweet</p>--%>
                <%--<p><a class="btn btn-embossed btn-primary view" role="button">Free Download</a></p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<!-- Contact -->
<div id="contact" class="content-section-a">
    <div class="container">
        <div class="row">

            <div class="col-md-6 col-md-offset-3 text-center wrap_title">
                <h2>加入 我们</h2>
                <%--<p class="lead" style="margin-top:0">一次 难忘 的 体 验</p>--%>
            </div>

            <form role="form" id="import_form">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name">您的游戏名</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="name" id="name" placeholder="Your Name" required>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="phone">您的联系方式</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="phone" id="phone" placeholder="QQ 、Wechat: 请输入您的联系方式" required>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="level">您的装备等级</label>
                        <div class="input-group">
                            <input type="text" class="form-control" name="equip_level" id="level" placeholder="Number" required>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="profession">您的职业</label>
                        <div class="input-group">
                            <select type="text" class="form-control" name="profession" id="profession">
                            </select>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="message">您的基本信息</label>
                        <div class="input-group">
                            <textarea name="message" id="message" class="form-control" rows="5" required></textarea>
                            <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
                        </div>
                    </div>

                    <input type="button" name="submit" id="submit" value="提交" class="btn wow tada btn-embossed btn-primary pull-right">
                </div>
            </form>

            <hr class="featurette-divider hidden-lg">
            <div class="col-md-5 col-md-push-1 address">
                <address>
                    <h3>怎么  输入 ?</h3>
                    <p class="lead">  <br>
                        游戏名: XXXXX<br>
                        联系方式: XXXXXXX<br>
                        装备等级: XXX<br>
                        职业: 请选择您的职业<br>
                        信息: 您的需求、建议以及您的副本经验</p>
                </address>
            </div>
        </div>
    </div>
</div>



<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <h3 class="footer-title">Follow Me!</h3>
                <p>Vuoi ricevere news su altri template?<br/>
                    Visita Andrea Galanti.it e vedrai tutte le news riguardanti nuovi Theme!<br/>
                    Go to: <a  href="http://andreagalanti.it" target="_blank">andreagalanti.it</a> More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                </p>

                <!-- LICENSE -->
                <a rel="cc:attributionURL" href=""
                   property="dc:title">Flatfy Theme </a> by
                <a rel="dc:creator" href=""
                   property="cc:attributionName">Andrea Galanti</a>
                is licensed to the public under
                <BR>the <a rel="license"
                           href="http://creativecommons.org/licenses/by-nc/3.0/it/deed.it">Creative
                Commons Attribution 3.0 License - NOT COMMERCIAL</a>.


            </div> <!-- /col-xs-7 -->

            <div class="col-md-5">
                <div class="footer-banner">
                    <h3 class="footer-title">Flatfy Theme</h3>
                    <ul>
                        <li>12 Column Grid Bootstrap</li>
                        <li>Form Contact</li>
                        <li>Drag Gallery</li>
                        <li>Full Responsive</li>
                        <li>Lorem Ipsum</li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
</footer>

<!-- JavaScript -->
<script src="${path}/FlatfyTheme/js/jquery-1.10.2.js"></script>
<script src="${path}/FlatfyTheme/js/bootstrap.js"></script>
<script src="${path}/FlatfyTheme/js/owl.carousel.js"></script>
<script src="${path}/FlatfyTheme/js/script.js"></script>
<script src="${path}/js/layer-v3.1.0/layer/layer.js"></script>
<!-- StikyMenu -->
<script src="${path}/FlatfyTheme/js/stickUp.min.js"></script>
<script type="text/javascript">

    $(function () {
        profession_query();
        news_query();


        $(document).ready( function() {
            $('.navbar-default').stickUp();

        });
    });
    //news查询
    function news_query(){
        $.ajax({
            url: '${path}/get_news_information',
            type: 'get',
            dataType: 'json',
            success: function (data) {

            }
        });
    }
    //profession查询
    function profession_query() {
        $.ajax({
            url: "${path}/profession/query_profession",
            type: "post",
            success:function (data) {
                $("#profession").append(data);
            }
        });
    }

    $(function (){
        $('#wechat').on('click',function () {
            layer.tips('会长微信号:<br>XXXXXXX', '#wechat', {
                tips: [4, '#3E4B54'],
                time: 4000
            });
        });
    });

   $(document).on('click', '#submit', function () {
       var name = $('#name').val();
       var phone = $('#phone').val();
       var level = $('#level').val();
       var message = $('#message').val();
       if (name.length == 0 || name == ''){
           layer.msg('您还有未填写的选项');
           $('#name').focus();
           return;
       }
       if (phone.length == 0 || phone == ''){
           layer.msg('您还有未填写的选项');
           $('#phone').focus();
           return;
       }
       if (level.length == 0 || level == ''){
           layer.msg('您还有未填写的选项');
           $('#level').focus();
           return;
       }
       if (isNaN(level) || level <= 0){
           layer.msg('您的装备等级有点奇怪的呢');
           $('#level').focus();
           return;
       }
       if (level > 1000){
           layer.msg('欧皇，您再看看呢！');
           $('#level').focus();
           return;
       }
       if (message.length == 0 || message == ''){
           layer.msg('您还有未填写的选项');
           $('#message').focus();
           return;
       }
       layer.confirm('确认无误?', {icon: 3, title:'提示'}, function(index){
           $.ajax({
               url: '${path}/applicant/add_applicanter',
               type: 'post',
               dataType: 'json',
               data: $('#import_form').serializeArray(),
               success:function (data) {
                   if (data['success'] == "1"){
                       $('#name').val('');
                       $('#phone').val('');
                       $('#level').val('');
                       $('#import_form textarea').val('');
                       layer.msg('您的申请已经成功提交<br>请耐心等待会有管理人员与您联系', {
                           icon: 1,
                           time: 10000, //10s后自动关闭
                           btn: ['知道了']
                       });
                   }
               },
               error:function () {
                   layer.msg('服务器开小差了');
               }
           });

           layer.close(index);
       });

   });
</script>
<!-- Smoothscroll -->
<script type="text/javascript" src="${path}/FlatfyTheme/js/jquery.corner.js"></script>
<script src="${path}/FlatfyTheme/js/wow.min.js"></script>
<script>
    new WOW().init();
</script>
<script src="${path}/FlatfyTheme/js/classie.js"></script>
<script src="${path}/FlatfyTheme/js/uiMorphingButton_inflow.js"></script>
<!-- Magnific Popup core JS file -->
<script src="${path}/FlatfyTheme/js/jquery.magnific-popup.js"></script>
</body>

</html>

