package com.test;  // 패키지 이름 선언 

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// 클래스 구현에 필요한 클래스들을 import 
// java.io -> 입출력
// java.servlet -> 서블릿 처리에 필요한 클래스들
/**
 * Servlet implementation class LoginServlet
 */
// URL에 들어갈 이름 서블릿은 이름으로 호출한다. 
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super(); // 클래스 생성자로 부모 HttpServlet 생성자를 호출하여 초기화
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    //doGet()함수는 GET방식의 http요청을 처리하는 함수
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uid = request.getParameter("id");
		String res = "<html><h3>User ID: " + uid + "</h3></html>";
		//HTML페이지를  직접 생성하여 응답메시지의 바디에 추가하여 전송한다.  
		response.getWriter().print(res);
		// 응답 메시지를 받은 브라우저는 html을 출력한다. 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
