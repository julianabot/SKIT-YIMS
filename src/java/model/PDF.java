/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Raphaelle
 */
public class PDF {
    public ByteArrayOutputStream userRecord(ResultSet rs, String user, String footer, int numRecord, String path) {
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time
        String date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time

        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        //String path = loader.getResource("../img/SK_Logo.png").getPath();

        Document record = new Document();
        record.setPageSize(PageSize.LETTER.rotate());
        ByteArrayOutputStream pdf = new ByteArrayOutputStream();
        

        try {

            PdfWriter.getInstance(record, pdf);

            record.open();

            for (int currentPage = 1; currentPage <= numRecord; currentPage++) {
                rs.next();
                ResultSetMetaData rsmd = rs.getMetaData();
                int columnID = rsmd.getColumnCount();
                
                Paragraph pageUser = new Paragraph("Exported by: " + user);
                pageUser.setAlignment(Element.ALIGN_LEFT);
                Paragraph pageRole = new Paragraph("Position: " + user);
                pageRole.setAlignment(Element.ALIGN_LEFT);
                Paragraph pageDate = new Paragraph("Date and Time Exported: " + date);
                pageDate.setAlignment(Element.ALIGN_LEFT);
                Image headerImg = Image.getInstance(path);
                headerImg.setAlignment(Image.RIGHT);
                headerImg.scaleToFit(200, 200);
                Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
                Font f2 = new Font(Font.FontFamily.HELVETICA, 12);
                Font f3 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);

                Paragraph drHead = new Paragraph("Database Report", f);
                drHead.setAlignment(Element.ALIGN_LEFT);

                PdfPTable drHeadTable = new PdfPTable(1);
                drHeadTable.setWidthPercentage(100);
                drHeadTable.setSpacingBefore(10f);
                drHeadTable.setSpacingAfter(5f);

                PdfPCell drHeadCell = new PdfPCell(drHead);
                drHeadCell.setBorder(Rectangle.NO_BORDER);
                drHeadCell.setHorizontalAlignment(Element.ALIGN_LEFT);
                drHeadCell.setVerticalAlignment(Element.ALIGN_LEFT);
//                drHeadCell.setPaddingLeft(10);
//                drHeadCell.setPaddingBottom(10);

                drHeadTable.addCell(drHeadCell);

                PdfPTable basicTable = new PdfPTable(7);
                basicTable.setWidthPercentage(100);
                basicTable.setSpacingBefore(5f);
                basicTable.setSpacingAfter(5f);


                Paragraph ft = new Paragraph(footer);
                ft.setAlignment(Element.ALIGN_RIGHT);
 

                PdfPCell c1 = new PdfPCell(new Paragraph("ID", f2));
                c1.setBorder(Rectangle.NO_BORDER);
                c1.setHorizontalAlignment(Element.ALIGN_LEFT);
                c1.setVerticalAlignment(Element.ALIGN_LEFT);
                //c1.setPaddingLeft(10);

                PdfPCell c2 = new PdfPCell(new Paragraph("Name:", f2));
                c2.setBorder(Rectangle.NO_BORDER);
                c2.setHorizontalAlignment(Element.ALIGN_LEFT);
                c2.setVerticalAlignment(Element.ALIGN_LEFT);
                //c2.setPaddingLeft(10);

                PdfPCell c3 = new PdfPCell(new Paragraph("Agegroup", f2));
                c3.setBorder(Rectangle.NO_BORDER);
                c3.setHorizontalAlignment(Element.ALIGN_LEFT);
                c3.setVerticalAlignment(Element.ALIGN_LEFT);
                //c3.setPaddingLeft(10);

                PdfPCell c4 = new PdfPCell(new Paragraph("Birthday", f2));
                c4.setBorder(Rectangle.NO_BORDER);
                c4.setHorizontalAlignment(Element.ALIGN_LEFT);
                c4.setVerticalAlignment(Element.ALIGN_LEFT);
                //c4.setPaddingLeft(10);

                PdfPCell c5 = new PdfPCell(new Paragraph("Address", f2));
                c5.setBorder(Rectangle.NO_BORDER);
                c5.setHorizontalAlignment(Element.ALIGN_LEFT);
                c5.setVerticalAlignment(Element.ALIGN_LEFT);
                //c5.setPaddingLeft(10);

                PdfPCell c6 = new PdfPCell(new Paragraph("Gender", f2));
                c6.setBorder(Rectangle.NO_BORDER);
                c6.setHorizontalAlignment(Element.ALIGN_LEFT);
                c6.setVerticalAlignment(Element.ALIGN_LEFT);
                //c6.setPaddingLeft(10);

                PdfPCell c7 = new PdfPCell(new Paragraph("Valid ID", f2));
                c7.setBorder(Rectangle.NO_BORDER);
                c7.setHorizontalAlignment(Element.ALIGN_LEFT);
                c7.setVerticalAlignment(Element.ALIGN_LEFT);
                //c7.setPaddingLeft(10);


                basicTable.addCell(c1);
                basicTable.addCell(c2);
                basicTable.addCell(c3);
                basicTable.addCell(c4);
                basicTable.addCell(c5);
                basicTable.addCell(c6);
                basicTable.addCell(c7);

                PdfPCell cell;

                cell = new PdfPCell(new Paragraph(String.valueOf(columnID), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                //cell.setPaddingLeft(10);
                basicTable.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("name"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                //cell.setPaddingLeft(10);
                basicTable.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("agegroup"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                //cell.setPaddingLeft(10);
                basicTable.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("birthday"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                //cell.setPaddingLeft(10);
                basicTable.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("address"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                //cell.setPaddingLeft(10);
                basicTable.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("gender"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                //cell.setPaddingLeft(10);
                basicTable.addCell(cell);

                cell = new PdfPCell(new Paragraph(rs.getString("validID"), f3));
                cell.setBorder(Rectangle.NO_BORDER);
                cell.setVerticalAlignment(Element.ALIGN_LEFT);
                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
                //cell.setPaddingLeft(10);
                basicTable.addCell(cell);


                String pagination = String.format("Page %d of %d", currentPage, numRecord);
                Paragraph pageNumber = new Paragraph(pagination);
                pageNumber.setAlignment(Element.ALIGN_RIGHT);

//            record.add(header);
                record.add(headerImg);
                record.add(drHeadTable);
                record.add(basicTable);
                //record.add(new Paragraph(" "));
                for (int i = 0; i < basicTable.size(); i++) {
                    record.add(new Paragraph(" "));
                }

                record.add(pageDate);
                record.add(ft);
            }
            record.newPage();

            record.close();

        } catch (SQLException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (DocumentException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pdf;
    }
}
