package resumehub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ResumeServlet")
public class ResumeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        try {

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String skills = request.getParameter("skills");
            String education = request.getParameter("education");
            String experience = request.getParameter("experience");
            String projects = request.getParameter("projects");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO resume(name,email,phone,address,skills,education,experience,projects) VALUES(?,?,?,?,?,?,?,?)"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setString(5, skills);
            ps.setString(6, education);
            ps.setString(7, experience);
            ps.setString(8, projects);

            ps.executeUpdate();

            response.sendRedirect("viewResume.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}