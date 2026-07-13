package resumehub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement("DELETE FROM resume WHERE id=?");

            ps.setInt(1, id);
            ps.executeUpdate();

            response.sendRedirect("viewResume.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}