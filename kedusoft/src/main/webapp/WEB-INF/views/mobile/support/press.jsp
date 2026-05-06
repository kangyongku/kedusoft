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
			<li><a href="/support/notice" >보도자료</a></li>
			<li><a href="/support/qna" >Q&A</a></li>
		</ul>
	</div>
	<section class="sub_con">
		<%@ include file="/WEB-INF/views/include/left.jsp"%>
		<div class="content">
			<div class="contentTitleArea">
				<h3>${menuDto.title }</h3>
				<span class="directory">고객지원 >　${menuDto.title  }</span>
			</div>
			
			<div class="bbsWidth">
				<div class="board_search">
					<form id="search" name="search" method="post" action="/sub/bbs.asp">
					<input type="hidden" name="mode" value="list">
					
					<select name="keyfield">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="name">작성자</option>
					</select>
					<input type="text" name="key" maxlength="10" onchange="this.value=this.value.replace('(','');" value="">
					<a href="javascript:go_search();"><span class="bbsSearch">검색</span></a>
					
					</form>
				</div>
			</div>
			<!----------------------- 리스트 시작 ----------------------------->			
			<div class="bbsWidth">
				<table class="bbsTable">
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="13%">
						<col width="13%">
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
						<tr onclick="go_view(1);">
							<td>1</td>
							<td>새소식</td>
							<td>관리자</td>
							<td>100</td>
							<td>2026-05-05</td>
						</tr>
						<tr onclick="go_view(2);">
							<td>2</td>
							<td>새소식</td>
							<td>관리자</td>
							<td>100</td>
							<td>2026-05-05</td>
						</tr>
						<tr onclick="go_view(3);">
							<td>3</td>
							<td>새소식</td>
							<td>관리자</td>
							<td>100</td>
							<td>2026-05-05</td>
						</tr>
					</tbody>
				</table>
			                
				<div class="board_page">
					<span class="board_num">
						<a>◀</a>
						<a href='javascript:go_page("1")'>1</a>
						<a href='javascript:go_page("2")'>2</a>
						<a href='javascript:go_page("3")'>3</a>
						<a>▶</a>
					</span>
				</div>
			</div>
			<!------------------  리스트 종료 ---------------------->
		
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>