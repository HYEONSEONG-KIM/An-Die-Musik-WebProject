<%@page import="adm.vo.QnaVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<QnaVO> list = (List<QnaVO>)request.getAttribute("qnaList");
// List<QnaVO> list2 = (List<QnaVO>)request.getAttribute("list2");
int spage = (Integer)request.getAttribute("sp");
int epage = (Integer)request.getAttribute("ep");
int tpage = (Integer)request.getAttribute("tp");


%>

{
	"tp" : "<%= tpage %>",
	"ep" : "<%= epage %>",
	"sp" : "<%= spage %>",
	"datas" : [

<% 	
	for(int i = 0; i < list.size(); i++){
		QnaVO vo = list.get(i);
		if(i > 0) out.print(",");

%>
	{
		"code" : "<%= vo.getQna_code() %>",
		"title" : "<%= vo.getQna_title() %>",
		"content" : "<%=vo.getQna_content().replaceAll("\r\n", "<br>") %>",
		"date" : "<%= vo.getQna_date() %>",
		"cnt" : "<%= vo.getQna_cnt()%>",
		"mem_id" : "<%=vo.getMem_id() %>",
		"rnum" : "<%=vo.getRnum() %>"

		
	}


<%
	}
%>
  ]

}