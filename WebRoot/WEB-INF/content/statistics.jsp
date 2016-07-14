<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title> 
    <link href="<%=path%>/css/whx.css" rel="stylesheet">
    <style type="text/css">
    #whx{
    font-family:'Microsoft YaHei';
    line-height: 1em;
    color: #FDA30E;
    font-weight:bold;
    font-size: 32px;
    text-shadow:0px 0px 0 rgb(228,228,228),1px 1px 0 rgb(210,210,210),2px 2px 0 rgb(193,193,193),3px 3px 0 rgb(175,175,175),4px 4px 0 rgb(158,158,158), 5px 5px 0 rgb(141,141,141),6px 6px 5px rgba(0,0,0,0.6),6px 6px 1px rgba(0,0,0,0.5),0px 0px 5px rgba(0,0,0,.2);}

   } 
     </style>
     <style type="text/css">
    #hx{
    font-family:'Microsoft YaHei';
    line-height:1em;
    color:  #ffffff;
    font-weight:bold;
    font-size: 60px;
    text-shadow:0px 0px 0 rgb(228,228,228),1px 1px 0 rgb(210,210,210),2px 2px 0 rgb(193,193,193),3px 3px 0 rgb(175,175,175),4px 4px 0 rgb(158,158,158), 5px 5px 0 rgb(141,141,141),6px 6px 5px rgba(0,0,0,0.6),6px 6px 1px rgba(0,0,0,0.5),0px 0px 5px rgba(0,0,0,.2);
    text-align:center;
    width:100%;
    height:85px;
    background:#FB9600;

   } 
   </style>
     <style type="text/css">
   #x{ 
   width:100%;
   height:35px;
   border-bottom-left-radius:12px;
   border-bottom-right-radius:12px;
   background:#F6F6F6;
   }
    </style>
    
</head>
<body>
   <input type="button" id="data1" value='${jsondata}' style="display:none;"></input> 
    <script type="text/javascript" src="<%=path%>/Scripts/histogram/Data.js" ></script>
     <script type="text/javascript" src="<%=path%>/Scripts/histogram/quickwin.verticalbar.js" ></script>
    <script type="text/javascript" src="<%=path%>/Scripts/histogram/quickwin.horizontalbar.js" ></script>
     <script type="text/javascript" src="<%=path%>/Scripts/histogram/quickwin.histogram.js" ></script> 
    <div id="hx" >
              <div style="padding-top:7px;">销量统计</div></div> 
    <div id="x" style="border:1px solid #d3d3d3;"></div>
   <canvas id ="myCanvas"  style="border:1px solid #d3d3d3;margin-left:28%;margin-top:2%;" ></canvas>
     <div id="whx" style="text-align:center;margin-top:5px;">woderland书店   当前一共卖出<font color=#FD5204>${total}</font>本书<div>
      <a href="/mall/managerCenter.do" class="button">
      <span>返回管理主页</span>
      </a>
    <script type="text/javascript">
      var c = document.getElementById("myCanvas");
       /* var ctx = */ ;
       var v = new histogram(c.getContext("2d"),a,20);   
       v.draw();
       </script>
</body>
</html>
