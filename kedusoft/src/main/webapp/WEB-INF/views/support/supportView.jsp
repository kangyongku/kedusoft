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
			<li><a href="/support/notice">공지사항</a></li>
			<li><a href="/support/press">보도자료</a></li>
			<li><a href="/support/qna">Q&A</a></li>
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
				<table border="0" cellspacing="0" cellpadding="0" width=100%>
					<tr class=bbsTitle>
						<td class=subject>${boardView.boardTitle }</font></td>
					</tr>
					<tr>
						<td class="bbs_top" style="text-align:right; padding-right:5px;">
						<b>글쓴이</b> : ${boardView.boardWriter} <b>조회수</b> : ${boardView.boardCnt } <b>등록일</b> : ${boardView.regDate }
					 	</td>
					</tr>
					<tr>
						<td class="bbs_view">
							<div style="width:100%; border:5px solid #eeeeee; padding:10px; margin-bottom:20px;">
							<strong>[원본글]</strong>${boardView.boardTitle }<br>${boardView.boardContent }
							</div>
							<table width="100%" border="0" cellspacing="0" cellpadding="5">
								<tr>
						  			<td height="15">
										<strong>${boardView.boardTitle }</strong>
									</td>
								</tr>
								<tr>
						  			<td height=200 style="vertical-align:top;">
							  			<img src=/images/bt/ico_down.gif>
						 			</td>
								</tr>
							  </table>
						</td>
					</tr>
					<tr>
						<td class="bbs_content">첨부파일 : <a href="/bbs/download.asp?num=${boardView.boardIdx }&ctg=${boardView.boardIdx }&file_name=${boardView.boardIdx }" target="_self">
						<img src="/images/common/ico_down.gif" width="13" height="14" align='absmiddle' border=0><img src=/images/bt/ico_down.gif> ${boardView.boardIdx }</a></td>
					</tr>
					<tr>
						<td class="bbs_content">윗　　글 : <a href="javascript:bbs_mode('${boardView.boardIdx }','${boardView.boardIdx }','view')">${boardView.boardIdx }</a></td>
					</tr>
					<tr>
						<td class="bbs_content">아 랫 글 : <a href="javascript:bbs_mode('${boardView.boardIdx }','${boardView.boardIdx }','view')">${boardView.boardIdx }</a></td>
					</tr>
					<tr>
						<td height=10 style="border-top: solid 1px silver;"></td>
					</tr>
				 </table>
			</div>
			<div class="bbsWidth">
				<div class="board_search">
					<a href="javascript:bbs_mode('${boardView.boardIdx }','${boardView.boardIdx }','reply')"><span class=bbsSearch>답변</span></a>
					<a href="javascript:bbs_mode('${boardView.boardIdx }','${boardView.boardIdx }','del')"><span class=bbsSearch>삭제</span></a>
					<a href="javascript:bbs_mode('${boardView.boardIdx }','${boardView.boardIdx }','modify')"><span class=bbsSearch>수정</span></a>
					<a href="javascript:bbs_mode_page('${boardView.boardIdx }','${boardView.boardIdx }','list','${boardView.boardIdx }')"><span class=bbsSearch>목록</span></a>
				</div>
			</div>
			
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>