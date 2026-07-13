package resumehub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.pdf.PdfWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PDFServlet")
public class PDFServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition",
                    "attachment; filename=ResumeHub_Resume.pdf");

            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());

            document.open();

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement("SELECT * FROM resume ORDER BY id DESC LIMIT 1");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
                Font headFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14);
                Font bodyFont = FontFactory.getFont(FontFactory.HELVETICA, 12);

                // TITLE
                document.add(new Paragraph("RESUME HUB", titleFont));
                document.add(new Paragraph(" "));

                // BASIC INFO
                document.add(new Paragraph("PERSONAL INFORMATION", headFont));
                document.add(new Paragraph("Name: " + rs.getString("name"), bodyFont));
                document.add(new Paragraph("Email: " + rs.getString("email"), bodyFont));
                document.add(new Paragraph("Phone: " + rs.getString("phone"), bodyFont));
                document.add(new Paragraph("Address: " + rs.getString("address"), bodyFont));

                document.add(new Paragraph(" "));

                // SKILLS
                document.add(new Paragraph("SKILLS", headFont));
                document.add(new Paragraph(rs.getString("skills"), bodyFont));

                document.add(new Paragraph(" "));

                // EDUCATION
                document.add(new Paragraph("EDUCATION", headFont));
                document.add(new Paragraph(rs.getString("education"), bodyFont));

                document.add(new Paragraph(" "));

                // EXPERIENCE
                document.add(new Paragraph("EXPERIENCE", headFont));
                document.add(new Paragraph(rs.getString("experience"), bodyFont));

                document.add(new Paragraph(" "));

                // PROJECTS
                document.add(new Paragraph("PROJECTS", headFont));
                document.add(new Paragraph(rs.getString("projects"), bodyFont));
            }

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}