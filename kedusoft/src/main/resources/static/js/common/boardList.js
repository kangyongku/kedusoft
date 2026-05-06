
function go_search(){
	var f = document.search;
	if (f.keyWord.value=='') {
		f.keyWord.focus(); alert('검색어를 입력해 주세요.'); return; 
	}
	f.submit();
}

function go_view(boardIdx){
	var f = document.view;
	f.boardIdx.value = boardIdx;
	f.action = "/support/view";
	f.submit();
}

function go_page(pageNo){
	var f = document.search;
	f.pageIndex.value = pageNo;
	f.submit();
}