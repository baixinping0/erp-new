<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function() {
		$("#query").click(function() {
			$("[name='pageNum']").val(1);
			$("form:first").submit();
		});
	});
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">入库</span>
		</div>
	</div>
	<div class="content-text">
		<form action="order_inStoreList" method="post">
			<div class="square-o-top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td width="10%">跟单人:</td>
						<td width="25%"><s:select name="orderq.completer.uuid" list="empList"
												  listKey="uuid" listValue="name" headerKey="-1"
												  headerValue="---请-选-择---" cssClass="kuan" />
						<td width="15%"><a id="query">
							<img src="images/can_b_01.gif" border="0" /> </a>
						</td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(images/table_bg.gif) repeat-x;">
						<td width="30%" height="30">订单号</td>
						<td width="20%">跟单人</td>
						<td width="20%">种类</td>
						<td width="20%">入库</td>
					</tr>
					<s:iterator value="orderList">
						<tr align="center" bgcolor="#FFFFFF">
							<td height="30">${orderNum}</td>
							<td>${completer.name}</td>
							<td>${orderTypeView}</td>
							<td>
								<img src="images/icon_3.gif" /> 
								<span style="line-height:12px; text-align:center;"> 
									<s:a action="order_inStoreDetail">入库
										<s:param name="order.uuid" value="uuid"/>
									</s:a>
								</span>
							</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</form>
	</div>
	<div class="content-bbg"></div>
</div>
