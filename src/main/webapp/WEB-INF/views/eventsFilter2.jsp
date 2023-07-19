<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${raceList}" var="race" varStatus="vs">
						<div class="col-sm-6 col-md-4 col-lg-3 mb-5 mb-lg-5">
							
								<div class="custom-media d-block">
									<div class="img-wrap mb-3">
										<a onclick="selectRace(${race.race_id});"><img src="${race.race_pic}"
											alt="Image" class="img-fluid"></a>
									</div>
									<div>
										<h5 style="display: inline-block; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; width: 70%;"><a href="#" data-toggle="modal" data-target="#myModal${vs.index}">${race.race_name}</a></h5>
										<div style="display: inline-block; float: right; width: 30%">${race.race_con}</div>
										<div>${race.region_state} ${race.region_city}</div>
										<span class="caption" style="font-size: 10px"><fmt:formatDate pattern="yyyy-MM-dd" value="${race.race_date}"/></span>
									</div>
								</div>
							
						</div>
						<!-- Modal -->
			<div class="modal fade" id="myModal${vs.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        
			      </div>
			      <div class="modal-body">
			        <img src="${race.race_pic}"
											alt="Image" class="img-fluid">
			        <table>
			        <tr><td>대회명 : ${race.race_name}</td></tr>
			        <tr><td>주최 : ${race.race_org}</td></tr>
			        <tr><td>종목 : ${race.race_dist}</td></tr>
			        <tr><td>개최 지역 : ${race.region_city} </td></tr>
			        <tr><td>일시 : ${race.race_date}</td></tr>
			        <tr><td>접수 기간 :<fmt:formatDate pattern="yyyy-MM-dd" value="${race.race_apply}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd" value="${race.race_deadline}"/></td></tr>
			        <tr><td>상세정보 : <a href="${race.race_url}">${race.race_url}</a></td></tr>
			        </table>
			        
			        
			      </div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			       
			      </div>
			    </div>
			  </div>
			</div>
              </c:forEach>