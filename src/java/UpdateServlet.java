package resumehub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));

            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String skills = request.getParameter("skills");
            String education = request.getParameter("education");
            String experience = request.getParameter("experience");
            String projects = request.getParameter("projects");

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE resume SET name=?, email=?, phone=?, address=?, skills=?, education=?, experience=?, projects=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setString(5, skills);
            ps.setString(6, education);
            ps.setString(7, experience);
            ps.setString(8, projects);
            ps.setInt(9, id);

            int i = ps.executeUpdate();

            if (i > 0) {
                response.sendRedirect("viewResume.jsp");
            } else {
                response.getWriter().println("Update Failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}