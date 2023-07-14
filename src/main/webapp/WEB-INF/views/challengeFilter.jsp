<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:forEach items="${challList}" var="chall">
	<div
		style="width: 40%; float: left; border: 1px solid aqua; margin-right: 10%">

		<div>
			<div style="float: left; width: 35%;">
				<img src="${chall.chall_pic}" alt="Image" class="img-fluid"
					style="height: auto;">
			</div>
			<div style="float: left; width: 65%;">
				<div
					style="display: inline-block; float: left; border: 1px solid red; width: 30%; text-align: center;">${chall.chall_sit}</div>
				<div
					style="border: 1px solid green; float: left; width: 30%; margin-right: 40%; text-align: center;">${chall.chall_category}</div>
				<h5
					style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width: 140px;">
					<a href="#" data-toggle="modal" data-target="#myModal">${chall.chall_name}</a>
				</h5>
				<c:if test="${chall.chall_category ne null}">
					<div style="font-size: 10px">대회명</div>
				</c:if>

				<div style="font-size: 10px">${chall.region_id}</div>
				<div class="caption" style="font-size: 10px">
					<fmt:formatDate pattern="yyyy-MM-dd"
						value="${chall.chall_start_date}" />
					~
					<fmt:formatDate pattern="yyyy-MM-dd"
						value="${chall.chall_end_date}" />
					/ 인증 주 ${chall.chall_week_auth}회 / 최대 ${chall.chall_size}명
				</div>
				<div class="caption" style="font-size: 10px"></div>
			</div>
		</div>

	</div>
</c:forEach>