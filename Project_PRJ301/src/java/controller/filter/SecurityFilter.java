/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.filter;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author quocb
 */
@WebFilter(filterName = "SecurityFilter", urlPatterns = { "/HomeController", "/detail", "/add-to-cart", "/checkout", "/admin"})
public class SecurityFilter implements Filter {
    
    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;
    
    public SecurityFilter() {
    }    

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        Account account = (Account) req.getSession().getAttribute("account");
         if(account == null){//yêu cầu đăng nhập
             //kiểm tra cookie nếu mà hợp lệ thì cho qua
            Cookie[] cookies = req.getCookies();
            String username=null;
            String password = null;
            
             for (Cookie cooky : cookies) {
                 if(cooky.getName().equals("username")){
                 username = cooky.getValue();
                 }
                  if(cooky.getName().equals("password")){
                 password = cooky.getValue();
                 }
                  if(username != null && password != null){// đã lấy đủ user and pass
                      break;
                  }
             }
             //kiểm tra nếu user and pass != null thì check
             if(username != null && password != null){
                 Account account1 = new AccountDAO().login(username, password);
                 if(account != null){ // đăng nhập thành công cookie hợp lệ
                     req.getSession().setAttribute("account", account1);
                     chain.doFilter(request, response);
                     return;
                 }
             }
             //nếu không hợp lệ cookie thì phải đăng nhập
                res.sendRedirect("login");
            }
            else{//đã đăng nhập
                chain.doFilter(request, response);//cho qua filter
            }
        
    }
    /**
     * Destroy method for this filter
     */
    @Override
    public void destroy() {        
    }

    /**
     * Init method for this filter
     * @param filterConfig
     */
    @Override
    public void init(FilterConfig filterConfig) {        
       
    }
  
    
}
