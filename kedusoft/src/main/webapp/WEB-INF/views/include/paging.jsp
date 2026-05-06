<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int totalCount = Integer.parseInt(String.valueOf(request.getAttribute("totalCount")));
	int nowPage  = Integer.parseInt(String.valueOf(request.getAttribute("currPage")));
	int	countPerBlock = 10;
	int firstPage = 0;
	int prevPage = 0;
	int nextPage = 0;
	int totalPage = (int)((totalCount - 1)/10) + 1;
	int lastPage = totalPage;
	if(totalPage == 0) totalPage = 1 ;
	int totalBlock = (int)((totalPage - 1)/countPerBlock);
	int nowBlock = (int)((nowPage - 1)/countPerBlock);
	if (nowBlock > 0) {
		firstPage = 1;
	}
	if( nowPage > 1 ) {
		prevPage = nowPage - 1;
	}
	int startPage = nowBlock * countPerBlock + 1;
	int endPage = countPerBlock * (nowBlock + 1);
	if ( endPage > totalPage ) endPage = totalPage;
	if( nowPage < totalPage ) {
		nextPage = nowPage + 1;
	}
	if( nowBlock < totalBlock ) {
		lastPage = totalPage;
	}
 %>
    
<div class="board_page">
	<span class="board_num">
	<!-- 
		<a>◀</a>
		<a href='javascript:go_page("1")'>1</a>
		<a href='javascript:go_page("2")'>2</a>
		<a href='javascript:go_page("3")'>3</a>
		<a>▶</a>
	 -->
	<% if (prevPage > 0) { %>
		<a href="javascript:go_page('<%=prevPage%>');">◀</a>
	<% }else{ %>
		<a>◀</a>
	<% } %>
	
	<% for (int indexI = startPage; indexI <= endPage; indexI++) { %>
	<%		if (indexI == nowPage) { %>
		<a class="num_on" href="javascript:go_page('<%=indexI%>');"><span class=gotoPage><%=indexI %></span></a>
	<%		} else { %>
		<a href="javascript:go_page('<%=indexI%>');"><span class=gotoPage><%=indexI %></span></a>
	<%		} %>
	<% } %>
	
	<% if (nextPage > 0) { %>
		<a href="javascript:go_page('<%=nextPage%>');">▶</a>
	<% }else{ %>
		<a>▶</a>
	<% } %>	
	</span>
</div>