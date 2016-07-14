var b=document.getElementById("data1").value;
b  = JSON.parse(b);
var a={"title":"各类书销售百分比","verticaltitle":"本数（%）","horizontaltitle":"书类别","data":[{"category":"营业本数(%)","datacollection":b}]}