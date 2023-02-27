<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
// 컨텍스트 패스 받기
String contextPath=(String)pageContext.getAttribute("contextPath");
HashMap<String, Object> menuMap = new HashMap<>(); // 키를 인테저로 선언하면 jstl에서 인식을 못하므로 주의

menuMap.put("1", new HashMap<String, Object>(){{
	put("title", "회사 소개");	
	put("url", contextPath+"/html/intro");
	put("sub", new HashMap<String, Object>(){{
		put("1",new HashMap<String, Object>(){{
			put("title", "회사 소개");	
			put("url", contextPath+"/html/intro");	
		}});
		put("2",new HashMap<String, Object>(){{
			put("title", "오시는 길");	
			put("url", contextPath+"/html/direction");
		}});		
	}});
}});
menuMap.put("2", new HashMap<String, Object>(){{
	put("title", "보유 차량");	
	put("url", contextPath+"/car/list");
	put("sub", new HashMap<String, Object>(){{
		put("1",new HashMap<String, Object>(){{
			put("title", "보유 차량");	
			put("url", contextPath+"/car/list");	
		}});
		put("2",new HashMap<String, Object>(){{
			put("title", "캠핑카 대여 회사");	
			put("url", contextPath+"/company/list?keyword=");		
		}});		
	}});
}});
menuMap.put("3", new HashMap<String, Object>(){{
	put("title", "실시간 예약");	
	put("url", contextPath+"/rent/list");
	put("sub", new HashMap<String, Object>(){{
		put("1",new HashMap<String, Object>(){{
			put("title", "실시간 예약");	
			put("url", contextPath+"/rent/list");	
		}});	
	}});
}});
menuMap.put("4", new HashMap<String, Object>(){{
	put("title", "예약 확인");	
	put("url", contextPath+"/rent/read");
	put("sub", new HashMap<String, Object>(){{
		put("1",new HashMap<String, Object>(){{
			put("title", "예약 확인");	
			put("url", contextPath+"/rent/read");	
		}});	
	}});
}});
menuMap.put("5", new HashMap<String, Object>(){{
	put("title", "커뮤니티");	
	put("url", contextPath+"/garage/list");
	put("sub", new HashMap<String, Object>(){{		
		put("1",new HashMap<String, Object>(){{
			put("title", "정비소 검색");	
			put("url", contextPath+"/garage/list?keyword=");	
		}});			
	}});
}});
menuMap.put("6", new HashMap<String, Object>(){{
	put("title", "고객센터");	
	put("url", contextPath+"/qna/qnalist?keyword=");
	put("sub", new HashMap<String, Object>(){{
		put("1",new HashMap<String, Object>(){{
			put("title", "이용 문의");	
			put("url", contextPath+"/qna/qnalist?keyword=");	
		}});
		put("2",new HashMap<String, Object>(){{
			put("title", "공지 사항");	
			put("url", contextPath+"/notice/list");	
		}});
		put("3",new HashMap<String, Object>(){{
			put("title", "자주하는 질문");	
			put("url", contextPath+"/faqboard/listAll?keyword=");	
		}});	
	}});
}});
menuMap.put("7", new HashMap<String, Object>(){{
	put("title", "로그인");	
	put("url", "#");
	put("sub", new HashMap<String, Object>(){{
		put("1",new HashMap<String, Object>(){{
			put("title", "회원 가입");	
			put("url", contextPath+"/user/join");	
		}});		
		put("2",new HashMap<String, Object>(){{
			put("title", "로그인");	
			put("url", contextPath+"/user/login");	
		}});
	}});
}});
menuMap.put("8", new HashMap<String, Object>(){{
	put("title", "제휴 문의");	
	put("url", "#");
	put("sub", new HashMap<String, Object>(){{
		put("1",new HashMap<String, Object>(){{
			put("title", "대여 회사 등록 신청");	
			put("url", contextPath+"/company/registerForm");	
		}});		
		put("2",new HashMap<String, Object>(){{
			put("title", "정비소 등록 신청");	
			put("url", contextPath+"/garage/register");	
		}});
		put("3",new HashMap<String, Object>(){{
			put("title", "정비소 등록신청 현황");	
			put("url", contextPath+"/admin/garage/register");	
		}});
		put("4",new HashMap<String, Object>(){{
			put("title", "정비소 정보 수정 및 삭제");	
			put("url", contextPath+"/admin/garage/list?keyword=");	
		}});		
	}});
}});


// 해시맵 jstl로 뿌리기
pageContext.setAttribute("menuMap", menuMap);
%>