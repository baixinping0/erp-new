<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	function showMsg(msg,uuid){
		top.$('context-msg').style.display = "block";
		top.$('context-msg-text').innerHTML=msg;
		top.$('hid-action').value="actionName";
		top.lock.show();
	}
</script>
<div class="content-right">
	<div class="content-r-pic_w">
		<div style="margin:8px auto auto 12px;margin-top:6px">
			<span class="page_title">仓库管理</span>
		</div>
	</div>
	<div class="content-text">
		<form action="storeDetail_list" method="post">
			<div class="square-o-top">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					style="font-size:14px; font-weight:bold; font-family:"黑体";">
					<tr>
						<td width="10%">仓库名称:</td>
						<td><s:select name="storeDetailq.store.uuid" list="storeList"
									  listKey="uuid" listValue="name" headerKey="-1"
									  headerValue="---请-选-择---" cssClass="kuan" /></td>
						<td>
						<td width="10%">商品名称:</td>
						<td><s:select name="storeDetailq.goods.uuid" list="goodsList"
									  listKey="uuid" listValue="name" headerKey="-1"
									  headerValue="---请-选-择---" cssClass="kuan" /></td>
						<td>
						<td width="">
							<a id="query"><img src="images/can_b_01.gif" border="0" /> </a></td>
					</tr>
				</table>
			</div>
			<!--"square-o-top"end-->
			<div class="square-order">
				<table width="100%" border="1" cellpadding="0" cellspacing="0">
					<tr align="center"
						style="background:url(images/table_bg.gif) repeat-x;">
						<td width="20%" height="30">仓库名称</td>
						<td width="20%">商品</td>
						<td width="44%">数量</td>
					</tr>
					<s:iterator value="storeDetailList">
						<tr align="center" bgcolor="#FFFFFF">
							<td width="13%" height="30">${store.name}</td>
							<td>${goods.name}</td>
							<td align="left">&nbsp;${num }</td>
						</tr>
					</s:iterator>
				</table>
			</div>
		</form>
	</div>
	<div class="content-bbg"></div>
</div>
