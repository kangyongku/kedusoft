<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<body>
<script language="javascript" src="/js/common/boardList.js"></script>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="divMenu menus">
		<ul>
			<li><a href="/support/notice" >공지사항</a></li>
			<li><a href="/support/press" >보도자료</a></li>
			<li><a href="/support/qna" >Q&A</a></li>
		</ul>
	</div>
	<section class="sub_con">
		<%@ include file="/WEB-INF/views/include/left.jsp"%>
		<div class="content">
			<div class="contentTitleArea">
				<h3>${menuDto.title }</h3>
				<span class="directory">고객지원 >　${menuDto.title}</span>
			</div>
			
			<div class="bbsWidth">
				<div class="board_search">
					<form id="search" name="search" method="post" action="/support/notice">
					<input type="hidden" name="mode" value="list">
					<input type="hidden" name="boardId" value="notice">
					<input type="hidden" name="pageIndex" value="1">
					<select name="keyfield">
						<option value="" <c:if test="${param.keyfield eq '' }">selected</c:if>>선택</option>
						<option value="title" <c:if test="${param.keyfield eq 'title' }">selected</c:if>>제목</option>
						<option value="content" <c:if test="${param.keyfield eq 'content' }">selected</c:if>>내용</option>
						<option value="name" <c:if test="${param.keyfield eq 'name' }">selected</c:if>>작성자</option>
					</select>
					<input type="text" name="keyWord" onchange="this.value=this.value.replace('(','');" value="${param.keyWord }">
					<a href="javascript:go_search();"><span class="bbsSearch">검색</span></a>
					</form>
					<form id="view" name="view" method="post" >
					<input type="hidden" name="boardId" value="notice">
					<input type="hidden" name="boardIdx" value="">
					<input type="hidden" name="title" value="${menuDto.title}">
					<input type="hidden" name="menuHead" value="${menuDto.menuHead}">
					<input type="hidden" name="menuLeft" value="${menuDto.menuLeft}">
					</form>
				</div>
			</div>
			<!----------------------- 리스트 시작 ----------------------------->			
			<div class="bbsWidth">
				<table class="bbsTable">
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="15%">
						<col width="15%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th>번 호</th>
							<th>제 목</th>
							<th>글쓴이</th>
							<th>조회수</th>
							<th>일자</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
						<c:when test="${not empty boardList }">
						<c:forEach var="board" items="${boardList }">
							<tr onclick="go_view('${board.boardIdx }');">
								<td>${board.boardIdx }</td>
								<td>${board.boardTitle }</td>
								<td>${board.boardWriter }</td>
								<td>${board.boardCnt }</td>
								<td>${board.regDate }</td>
							</tr>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">등록된 글이 없습니다.</td>
							</tr>
						</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			    <%@ include file="/WEB-INF/views/include/paging.jsp"%>
			</div>
			<!------------------  리스트 종료 ---------------------->
			
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>