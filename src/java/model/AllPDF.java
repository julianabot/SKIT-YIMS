/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.itextpdf.text.*;
import com.itextpdf.text.html.WebColors;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEvent;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Raphaelle
 */
public class AllPDF {

    public void residentRecord(ResultSet rs, String user, String role, String filename, String path, int numRecord) throws DocumentException, SQLException, FileNotFoundException {
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time

        Document record = new Document();
        record.setPageSize(PageSize.LEGAL);
        record.setMargins(30, 30, 20, 30);
        ByteArrayOutputStream pdf = new ByteArrayOutputStream();
        int count = 1;

        String home = System.getProperty("user.home");
        PdfWriter writer = PdfWriter.getInstance(record, new FileOutputStream(home + "/Desktop/" + filename));

        HeaderFooterForALL event = new HeaderFooterForALL(path, user, role);
        record.setMargins(30, 30, 20 + event.getTableHeight(), 30);
        writer.setPageEvent((PdfPageEvent) event);

        event.setDateAndTime(current);

        record.open();
        for (int currentPage = 1; currentPage <= numRecord; currentPage++) {
            rs.next();

            Font f = new Font(Font.FontFamily.HELVETICA, 10, Font.NORMAL, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 11, Font.BOLD, BaseColor.BLACK);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
            BaseColor columnHeaderColor = WebColors.getRGBColor("#8B3535");

            PdfPTable table = new PdfPTable(4);
            table.setWidthPercentage(100);
            table.setSpacingAfter(10f);
            PdfPCell cell;
            table.setWidths(new int[]{2, 4, 3, 3});
            cell = new PdfPCell(new Phrase("ID", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.TOP);
            cell.setBorderWidth(2);
            cell.setPaddingTop(10);
            table.addCell(cell);

            cell = new PdfPCell(new Phrase("Full Name", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.TOP);
            cell.setBorderWidth(2);
            cell.setPaddingTop(10);
            table.addCell(cell);

            cell = new PdfPCell(new Phrase("Birthday", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.TOP);
            cell.setBorderWidth(2);
            cell.setPaddingTop(10);
            table.addCell(cell);

            cell = new PdfPCell(new Phrase("Agegroup", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.TOP);
            cell.setBorderWidth(2);
            cell.setPaddingTop(10);
            table.addCell(cell);

            table.setHeaderRows(1);

            cell = new PdfPCell(new Phrase(rs.getString("residentID"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("name"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("birthday"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("agegroup"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table.addCell(cell);

            PdfPTable table2 = new PdfPTable(3);
            table2.setWidthPercentage(100);
            table2.setSpacingAfter(10f);
            table2.setWidths(new int[]{3, 5, 3});
            cell = new PdfPCell(new Phrase("Gender", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table2.addCell(cell);

            cell = new PdfPCell(new Phrase("Address", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table2.addCell(cell);

            cell = new PdfPCell(new Phrase("Civil Status", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table2.addCell(cell);

            table2.setHeaderRows(1);

            cell = new PdfPCell(new Phrase(rs.getString("gender"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table2.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("address"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table2.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("civilStatus"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table2.addCell(cell);

            PdfPTable table3 = new PdfPTable(3);
            table3.setWidthPercentage(100);
            table3.setSpacingAfter(10f);
            table3.setWidths(new int[]{3, 4, 4});
            cell = new PdfPCell(new Phrase("Contact No.", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table3.addCell(cell);

            cell = new PdfPCell(new Phrase("Email", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table3.addCell(cell);

            cell = new PdfPCell(new Phrase("FB Name/URL", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table3.addCell(cell);

            table3.setHeaderRows(1);

            cell = new PdfPCell(new Phrase(rs.getString("contactNo"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table3.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("emailAddress"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table3.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("fbNameURL"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table3.addCell(cell);

            PdfPTable table4 = new PdfPTable(3);
            table4.setWidthPercentage(100);
            table4.setSpacingAfter(10f);
            table4.setWidths(new int[]{3, 3, 3});
            cell = new PdfPCell(new Phrase("Working Status", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table4.addCell(cell);

            cell = new PdfPCell(new Phrase("Job Employed", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table4.addCell(cell);

            cell = new PdfPCell(new Phrase("Educational Attainment", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table4.addCell(cell);

            table4.setHeaderRows(1);

            cell = new PdfPCell(new Phrase(rs.getString("workingStatus"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table4.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("jobEmployed"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table4.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("educationAttainment"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table4.addCell(cell);

            PdfPTable table5 = new PdfPTable(3);
            table5.setWidthPercentage(100);
            table5.setSpacingAfter(10f);
            table5.setWidths(new int[]{4, 4, 3});
            cell = new PdfPCell(new Phrase("Mother's Name", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table5.addCell(cell);

            cell = new PdfPCell(new Phrase("Mother's Occupation", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table5.addCell(cell);

            cell = new PdfPCell(new Phrase("Mother's Vital Status", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table5.addCell(cell);

            table5.setHeaderRows(1);

            cell = new PdfPCell(new Phrase(rs.getString("motherName"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table5.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("motherOccupation"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table5.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("vitalStatusMother"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table5.addCell(cell);

            PdfPTable table6 = new PdfPTable(3);
            table6.setWidthPercentage(100);
            table6.setSpacingAfter(10f);
            table6.setWidths(new int[]{4, 4, 3});
            cell = new PdfPCell(new Phrase("Father's Name", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table6.addCell(cell);

            cell = new PdfPCell(new Phrase("Father's Occupation", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table6.addCell(cell);

            cell = new PdfPCell(new Phrase("Father's Vital Status", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table6.addCell(cell);

            table6.setHeaderRows(1);

            cell = new PdfPCell(new Phrase(rs.getString("fatherName"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table6.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("fatherOccupation"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table6.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("vitalStatusFather"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table6.addCell(cell);

            PdfPTable table7 = new PdfPTable(3);
            table7.setWidthPercentage(100);
            table7.setSpacingAfter(10f);
            table7.setWidths(new int[]{2, 4, 4});
            cell = new PdfPCell(new Phrase("No. of Siblings", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table7.addCell(cell);

            cell = new PdfPCell(new Phrase("Sibling's Working Status/Education", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table7.addCell(cell);

            cell = new PdfPCell(new Phrase("Breadwinner", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table7.addCell(cell);

            table7.setHeaderRows(1);

            cell = new PdfPCell(new Phrase(rs.getString("noOfSiblings"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table7.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("siblingEducation"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table7.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("breadWinner"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table7.addCell(cell);

            PdfPTable table8 = new PdfPTable(3);
            table8.setWidthPercentage(100);
            table8.setSpacingAfter(10f);
            table8.setWidths(new int[]{3, 3, 3});
            cell = new PdfPCell(new Phrase("PWD", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table8.addCell(cell);

            cell = new PdfPCell(new Phrase("Resident Voter", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table8.addCell(cell);

            cell = new PdfPCell(new Phrase("Member of Organization", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table8.addCell(cell);

            table8.setHeaderRows(1);

            cell = new PdfPCell(new Phrase(rs.getString("PWD"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table8.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("residentVoter"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table8.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("memberOfOrg"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table8.addCell(cell);

            cell = new PdfPCell(new Phrase("Type of Disability", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table8.addCell(cell);

            cell = new PdfPCell(new Phrase("Are you willing to support the incoming projects of SK Ibayo-Tipas?", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table8.addCell(cell);

            cell = new PdfPCell(new Phrase("Name of Organization", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table8.addCell(cell);

            cell = new PdfPCell(new Phrase(rs.getString("typeOfDisability"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table8.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("supportSK"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table8.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("nameOfOrg"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table8.addCell(cell);

            PdfPTable table9 = new PdfPTable(4);
            table9.setWidthPercentage(100);
            table9.setSpacingAfter(10f);
            table9.setWidths(new int[]{3, 3, 3, 3});
            cell = new PdfPCell(new Phrase("Vaccinated for COVID 19?", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table9.addCell(cell);

            cell = new PdfPCell(new Phrase("Willing to be vaccinated?", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table9.addCell(cell);

            cell = new PdfPCell(new Phrase("Brand of vaccine", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table9.addCell(cell);

            cell = new PdfPCell(new Phrase("Vaccine Status of Resident", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table9.addCell(cell);

            table9.setHeaderRows(1);

            cell = new PdfPCell(new Phrase(rs.getString("vaccinated"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table9.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("willingForVaccine"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table9.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("brandOfVaccine"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table9.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("vaccineStatus"), f));
            cell.setBorder(Rectangle.BOTTOM);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);

            cell.setPaddingBottom(10);
            table9.addCell(cell);

            PdfPTable table10 = new PdfPTable(3);
            table10.setWidthPercentage(100);
            table10.setSpacingAfter(10f);
            table10.setWidths(new int[]{3, 5, 4});
            cell = new PdfPCell(new Phrase("How will you show your support in the upcoming projects of the SK ibayo tipas", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table10.addCell(cell);

            cell = new PdfPCell(new Phrase("If you are given a chance to have a job, what makes you worthy among others?", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table10.addCell(cell);

            cell = new PdfPCell(new Phrase("What would you like to say to the current SK Council of Ibayo-Tipas?", f2));
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell.setBorder(Rectangle.NO_BORDER);
            table10.addCell(cell);

            table10.setHeaderRows(1);

            cell = new PdfPCell(new Phrase(rs.getString("showSupport"), f));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            table10.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("jobChance"), f));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            table10.addCell(cell);
            cell = new PdfPCell(new Phrase(rs.getString("sayToSK"), f));
            cell.setBorder(Rectangle.NO_BORDER);
            cell.setVerticalAlignment(Element.ALIGN_LEFT);
            cell.setHorizontalAlignment(Element.ALIGN_LEFT);
            table10.addCell(cell);

            record.add(table);
            record.add(table2);
            record.add(table3);
            record.add(table4);
            record.add(table5);
            record.add(table6);
            record.add(table7);
            record.add(table8);
            record.add(table9);
            record.add(table10);
            event.setTotalPageCount(numRecord);
            record.newPage();
        }
        record.close();

    }
}
