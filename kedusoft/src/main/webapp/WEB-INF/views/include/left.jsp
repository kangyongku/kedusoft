<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tagLib.jsp"%>

<nav class="lnb">
<c:choose>
	<c:when test="${menuDto.menuHead eq 1 }">
		<ul>
			<li <c:if test="${menuDto.menuLeft eq 1 }">class='on'</c:if>>
			<a href="/orginfo/outline">서비스 개요</a></li>
			<li <c:if test="${menuDto.menuLeft eq 2 }">class='on'</c:if>>
			<a href="/orginfo/content">서비스 내용</a></li>
			<li <c:if test="${menuDto.menuLeft eq 3 }">class='on'</c:if>>
			<a href="/orginfo/map">찾아오시는 길</a>
			</li>
		</ul>
	</c:when>
	<c:when test="${menuDto.menuHead eq 2 }">
		<ul>
			<li <c:if test="${menuDto.menuLeft eq 1 }">class='on'</c:if>>
			<a href="/portfolio/guide">포트폴리오 안내</a>
			</li>
			<li <c:if test="${menuDto.menuLeft eq 2 }">class='on'</c:if>>
			<a href="/portfolio/content">포트폴리오 내용</a>
			</li>
		</ul>
	</c:when>
	<c:when test="${menuDto.menuHead eq 3 }">
		<ul>
			<li <c:if test="${menuDto.menuLeft eq 1 }">class='on'</c:if>>
			<a href="/project/contact">프로젝트 문의</a>
			</li>
			<li <c:if test="${menuDto.menuLeft eq 2 }">class='on'</c:if>>
			<a href="/project/application">프로젝트 신청 내역</a>
			</li>
		</ul>
	</c:when>
	<c:when test="${menuDto.menuHead eq 4 }">
		<ul>
			<li <c:if test="${menuDto.menuLeft eq 1 }">class='on'</c:if>>
			<a href="/support/notice">공지사항</a>
			</li>
			<li <c:if test="${menuDto.menuLeft eq 2 }">class='on'</c:if>>
			<a href="/support/press">보도자료</a>
			</li>
			<li <c:if test="${menuDto.menuLeft eq 3 }">class='on'</c:if>>
			<a href="/support/qna">Q&A</a>
			</li>
		</ul>
	</c:when>
	<c:when test="${menuDto.menuHead eq 5 and empty loginInfo}">
		<ul>
			<li <c:if test="${menuDto.menuLeft eq 1 }">class='on'</c:if>>
			<a href="/member/login">로그인</a>
			</li>
			<li <c:if test="${menuDto.menuLeft eq 2 }">class='on'</c:if>>
			<a href="/member/join">회원가입</a>
			</li>
			<li <c:if test="${menuDto.menuLeft eq 3 }">class='on'</c:if>>
			<a href="/member/find">계정찾기</a>
			</li>
		</ul>
	</c:when>
	<c:when test="${menuDto.menuHead eq 6 }">
		<ul>
			<li <c:if test="${menuDto.menuLeft eq 1 }">class='on'</c:if>>
			<a href="/policy/terms">이용약관</a>
			</li>
			<li <c:if test="${menuDto.menuLeft eq 2 }">class='on'</c:if>>
			<a href="/policy/privacy">개인정보처리방침</a>
			</li>
		</ul>
	</c:when>
	<c:otherwise>
	</c:otherwise>
	</c:choose>
</nav>