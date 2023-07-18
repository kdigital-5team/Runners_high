<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${challList}" var="chall">
						<div style="width: 45%; float:left; height:200px; background-color:#F0F0F0; margin:2%; margin-bottom:20px; border-radius: 5px;  cursor: pointer;" onclick="location.href='challenge/${chall.chall_id}'">
							
								<div>
									<div style="float: left; width: 35%; padding-top:35%; height:0;margin: 2%; border-radius: 5px;
										background-image: url('${chall.chall_pic}');
										background-position:center;
										background-size:cover;">
									</div>
									<div style="float: left; width: 59%; margin-left:2px;" >
										<c:if test="${chall.chall_sit eq '모집중'}">
										<div style="float: left; background-color:#FFCECE; width: 30%; text-align: center; margin-top: 4%; margin-bottom: 4%; border-radius: 5px;"><b>${chall.chall_sit}</b></div>
										</c:if>
										<c:if test="${chall.chall_sit eq '모집예정'}">
										<div style="float: left; background-color:#FFCECE; width: 30%; text-align: center; margin-top: 4%; margin-bottom: 4%; border-radius: 5px;"><b>${chall.chall_sit}</b></div>
										</c:if>
										<c:if test="${chall.chall_sit eq '모집종료'}">
										<div style="float: left; background-color:#FF9999; width: 30%; text-align: center; margin-top: 4%; margin-bottom: 4%; border-radius: 5px;"><b>${chall.chall_sit}</b></div>
										</c:if>
										<div style="float:left; width: 30%; margin-right: 40%; text-align: center; margin-top: 4%; border-radius: 5px; background-color: #FFCC99" ><b>${chall.chall_category}</b></div>
										<h3 style="overflow:hidden; text-overflow: ellipsis; white-space: nowrap; width: 100%; margin-right: 5%;"><a href="challenge/${chall.chall_id}">${chall.chall_name}</a></h3>
										<c:if test="${chall.chall_category eq '대회용'}">
											<div style="font-size: 15px">대회명</div>
										</c:if>
										
										<div style="font-size: 15px">${chall.region_state} ${chall.region_city}</div>
										<div class="caption" style="font-size: 15px"><fmt:formatDate pattern="yyyy-MM-dd" value="${chall.chall_start_date}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${chall.chall_end_date}"/></div>
										<div>인증 주 ${chall.chall_week_auth}회 / 최대 ${chall.chall_size}명</div>
									</div>
								</div>
							
						</div>
              </c:forEach>