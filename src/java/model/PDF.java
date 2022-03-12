/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.html.WebColors;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEvent;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Raphaelle
 */
public class PDF {

    public void basicInfoRecord(ResultSet rs, String user, String filename, String path) {
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time
        String date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time

        byte data[];

        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        //String path = loader.getResource("../img/SK_Logo.png").getPath();

        Document record = new Document();
        record.setPageSize(PageSize.LEGAL.rotate());
//        ByteArrayOutputStream pdf = new ByteArrayOutputStream();
        int count = 1;

        try {
            String home = System.getProperty("user.home");
            PdfWriter writer = PdfWriter.getInstance(record, new FileOutputStream(home + "/Desktop/" + filename));

            record.open();

            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.WHITE);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
            BaseColor columnHeaderColor = WebColors.getRGBColor("#8B3535");

//            Image headerImg = Image.getInstance(path);
//            headerImg.setAbsolutePosition(900, 520);
//            headerImg.scaleToFit(70, 70);
            HeaderFooterPageEvent event = new HeaderFooterPageEvent(path);
            writer.setPageEvent((PdfPageEvent) event);
            event.setHeader("Header");
            event.setFooter("Footer");
            event.setDateAndTime(current);
            event.setUsername(user);

//            Paragraph drHead = new Paragraph("Database Report", f);
//            drHead.setAlignment(Element.ALIGN_LEFT);
            PdfPTable basicTable = new PdfPTable(7);
            basicTable.setWidthPercentage(100);
            basicTable.setSpacingBefore(50f);
            basicTable.setSpacingAfter(20f);
            PdfPCell cell;
            basicTable.setWidths(new int[]{1, 4, 3, 2, 6, 3, 6});
            cell = new PdfPCell(new Phrase("ID", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            basicTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Name", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            basicTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Agegroup", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            basicTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Birthday", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            basicTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Address", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            basicTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Gender", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            basicTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Valid ID", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            basicTable.addCell(cell);

            basicTable.setHeaderRows(1);

            int x = 0;
            int y = 0;
            while (rs.next()) {
                //record.add(headerImg);
                x++;
                cell = new PdfPCell(new Phrase(rs.getString("basicID")));
                cell.setVerticalAlignment(Element.ALIGN_CENTER);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                basicTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("name")));
                basicTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("agegroup")));
                basicTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("birthday")));
                basicTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("address")));
                basicTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("gender")));
                basicTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("validID")));
                basicTable.addCell(cell);
                if (x % 15 == 0) {
                    count++;
                    record.add(new Paragraph(20, "\u00a0"));
                    //record.add(drHead);
                    record.add(basicTable);
                    basicTable = new PdfPTable(7);
                    basicTable.setWidthPercentage(100);
                    basicTable.setSpacingBefore(50f);
                    basicTable.setSpacingAfter(20f);
                    basicTable.setWidths(new int[]{1, 4, 3, 2, 6, 3, 6});
                    cell = new PdfPCell(new Phrase("ID", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    basicTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Name", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    basicTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Agegroup", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    basicTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Birthday", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    basicTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Address", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    basicTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Gender", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    basicTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Valid ID", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    basicTable.addCell(cell);
                    //System.out.print("PDF.java inside if count: " + count);
//                    count++;

                }
                //System.out.print("PDF.java inside while count: " + count);
//                event.setTotalPageCount(count);
            }
            record.add(new Paragraph(31, "\u00a0"));
            record.add(basicTable);
            basicTable = new PdfPTable(7);
            basicTable.setWidthPercentage(100);
            basicTable.setSpacingAfter(20f);
            basicTable.setWidths(new int[]{1, 4, 3, 2, 6, 3, 6});

            event.setTotalPageCount(count);
            record.newPage();
            record.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void contactInfoRecord(ResultSet rs, String user, String filename, String path) {
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time
        String date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time

        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        //String path = loader.getResource("../img/SK_Logo.png").getPath();

        Document record = new Document();
        record.setPageSize(PageSize.LEGAL.rotate());
        ByteArrayOutputStream pdf = new ByteArrayOutputStream();
        int count = 1;

        try {
            String home = System.getProperty("user.home");
            PdfWriter writer = PdfWriter.getInstance(record, new FileOutputStream(home + "/Desktop/" + filename));

            record.open();

            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.WHITE);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
            BaseColor columnHeaderColor = WebColors.getRGBColor("#8B3535");

            Image headerImg = Image.getInstance(path);
            headerImg.setAbsolutePosition(900, 520);
            headerImg.scaleToFit(70, 70);

            HeaderFooterPageEvent event = new HeaderFooterPageEvent(path);
            writer.setPageEvent((PdfPageEvent) event);
            event.setHeader("Header");
            event.setFooter("Footer");
            event.setDateAndTime(current);
            event.setUsername(user);

//            Paragraph drHead = new Paragraph("Database Report", f);
//            drHead.setAlignment(Element.ALIGN_LEFT);
            PdfPTable contactTable = new PdfPTable(5);
            contactTable.setWidthPercentage(100);
            contactTable.setSpacingBefore(30f);
            contactTable.setSpacingAfter(20f);
            PdfPCell cell;
            contactTable.setWidths(new int[]{1, 6, 4, 6, 7});
            cell = new PdfPCell(new Phrase("ID", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            contactTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Name", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            contactTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Contact Number", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            contactTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Email", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            contactTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Facebook Name or Facebook URL", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            contactTable.addCell(cell);

            int x = 0;
            while (rs.next()) {
                //record.add(headerImg);
                x++;
                cell = new PdfPCell(new Phrase(rs.getString("contactID")));
                cell.setVerticalAlignment(Element.ALIGN_CENTER);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                contactTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("name")));
                contactTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("contactNo")));
                contactTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("emailAddress")));
                contactTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("fbNameURL")));
                contactTable.addCell(cell);
                if (x % 25 == 0) {
                    count++;
                    record.add(new Paragraph(40, "\u00a0"));
                    //record.add(drHead);
                    record.add(contactTable);
                    contactTable = new PdfPTable(5);
                    contactTable.setWidthPercentage(100);
                    contactTable.setSpacingBefore(30f);
                    contactTable.setSpacingAfter(20f);
                    contactTable.setWidths(new int[]{1, 6, 4, 6, 7});
                    cell = new PdfPCell(new Phrase("ID", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    contactTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Name", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    contactTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Contact Number", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    contactTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Email", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    contactTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Facebook Name or Facebook URL", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    contactTable.addCell(cell);
                    //System.out.print("PDF.java inside if count: " + count);
//                    count++;

                }
                //System.out.print("PDF.java inside while count: " + count);
//                event.setTotalPageCount(count);
            }
            record.add(new Paragraph(40, "\u00a0"));
            record.add(contactTable);
            contactTable = new PdfPTable(5);
            contactTable.setWidthPercentage(100);
            contactTable.setSpacingBefore(30f);
            contactTable.setSpacingAfter(20f);
            contactTable.setWidths(new int[]{1, 6, 4, 6, 7});

            event.setTotalPageCount(count);
            record.newPage();
            event.setTotalPageCount(count);
            record.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void familyInfoRecord(ResultSet rs, String user, String filename, String path) {
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time
        String date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time

        ClassLoader loader = Thread.currentThread().getContextClassLoader();
        //String path = loader.getResource("../img/SK_Logo.png").getPath();

        Document record = new Document();
        record.setPageSize(PageSize.LEGAL.rotate());
        ByteArrayOutputStream pdf = new ByteArrayOutputStream();
        int count = 1;

        try {
            String home = System.getProperty("user.home");
            PdfWriter writer = PdfWriter.getInstance(record, new FileOutputStream(home + "/Desktop/" + filename));

            record.open();

            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 9, Font.BOLD, BaseColor.WHITE);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 8);
            BaseColor columnHeaderColor = WebColors.getRGBColor("#8B3535");

            HeaderFooterPageEvent event = new HeaderFooterPageEvent(path);
            writer.setPageEvent((PdfPageEvent) event);
            event.setHeader("Header");
            event.setFooter("Footer");
            event.setDateAndTime(current);
            event.setUsername(user);

            PdfPTable familyTable = new PdfPTable(11);
            familyTable.setWidthPercentage(100);
            familyTable.setSpacingBefore(30f);
            familyTable.setSpacingAfter(20f);
            PdfPCell cell;
            familyTable.setWidths(new int[]{2, 4, 4, 3, 4, 3, 3, 3, 2, 4, 4});
            cell = new PdfPCell(new Phrase("ID", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            familyTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Name", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            familyTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Mother's Name", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            familyTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Mother's Occupation", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            familyTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Father's Name", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            familyTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Father's Occupation", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            familyTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Vital Status of Mother", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            familyTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Vital Status of Father", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            familyTable.addCell(cell);
            cell = new PdfPCell(new Phrase("# of Sibling", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            familyTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Sibling's Education", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            familyTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Breadwinner", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            familyTable.addCell(cell);

            int x = 0;
            while (rs.next()) {
                x++;
                cell = new PdfPCell(new Phrase(rs.getString("familyID"), f3));
                cell.setVerticalAlignment(Element.ALIGN_CENTER);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                familyTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("name"), f3));
                familyTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("motherName"), f3));
                familyTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("motherOccupation"), f3));
                familyTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("fatherName"), f3));
                familyTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("fatherOccupation"), f3));
                familyTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("vitalStatusMother"), f3));
                familyTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("vitalStatusFather"), f3));
                familyTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("noOfSiblings"), f3));
                familyTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("siblingEducation"), f3));
                familyTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("breadWinner"), f3));
                familyTable.addCell(cell);
                if (x % 11 == 0) {
                    count++;
                    record.add(new Paragraph(60, "\u00a0"));
                    record.add(familyTable);
                    familyTable = new PdfPTable(11);
                    familyTable.setWidthPercentage(100);
                    familyTable.setSpacingBefore(30f);
                    familyTable.setSpacingAfter(20f);
                    familyTable.setWidths(new int[]{2, 4, 4, 3, 4, 3, 3, 3, 2, 4, 4});
                    cell = new PdfPCell(new Phrase("ID", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    familyTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Name", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    familyTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Mother's Name", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    familyTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Mother's Occupation", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    familyTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Father's Name", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    familyTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Father's Occupation", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    familyTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Vital Status of Mother", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    familyTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Vital Status of Father", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    familyTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("# of Sibling", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    familyTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Sibling's Education", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    familyTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Breadwinner", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    familyTable.addCell(cell);
                    //System.out.print("PDF.java inside if count: " + count);
//                    count++;
                }
                //System.out.print("PDF.java inside while count: " + count);
//                event.setTotalPageCount(count);
            }
            record.add(new Paragraph(60, "\u00a0"));
            record.add(familyTable);
            familyTable = new PdfPTable(11);
            familyTable.setWidthPercentage(100);
            familyTable.setSpacingBefore(30f);
            familyTable.setSpacingAfter(20f);
            familyTable.setWidths(new int[]{2, 4, 4, 3, 4, 3, 3, 3, 2, 4, 4});

            event.setTotalPageCount(count);
            record.newPage();
            event.setTotalPageCount(count);
            record.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void orgInfoRecord(ResultSet rs, String user, String filename, String path) {

//DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time
        String date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time

        Document record = new Document();
        record.setPageSize(PageSize.LEGAL.rotate());

        int count = 1;

        try {
            String home = System.getProperty("user.home");
            PdfWriter writer = PdfWriter.getInstance(record, new FileOutputStream("D:/Downloads/" + filename));

            record.open();

            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 9, Font.BOLD, BaseColor.WHITE);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 8);
            BaseColor columnHeaderColor = WebColors.getRGBColor("#8B3535");

            HeaderFooterPageEvent event = new HeaderFooterPageEvent(path);
            writer.setPageEvent((PdfPageEvent) event);
            event.setHeader("Header");
            event.setFooter("Footer");
            event.setDateAndTime(current);
            event.setUsername(user);

            PdfPTable orgTable = new PdfPTable(9);
            orgTable.setWidthPercentage(100);
            orgTable.setSpacingBefore(30f);
            orgTable.setSpacingAfter(20f);
            PdfPCell cell;
            orgTable.setWidths(new int[]{1, 4, 3, 3, 3, 2, 4, 4, 4});
            cell = new PdfPCell(new Phrase("ID", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            orgTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Name", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            orgTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Resident Voter", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            orgTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Member of Organization", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            orgTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Name of Organization", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            orgTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Support SK", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            orgTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Show Support", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            orgTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Job Chance", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            orgTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Say to SK", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            orgTable.addCell(cell);

            int x = 0;
            while (rs.next()) {
                x++;
                cell = new PdfPCell(new Phrase(rs.getString("organizationID"), f3));
                cell.setVerticalAlignment(Element.ALIGN_CENTER);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                orgTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("name"), f3));
                orgTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("residentVoter"), f3));
                orgTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("memberOfOrg"), f3));
                orgTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("nameOfOrg"), f3));
                orgTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("supportSK"), f3));
                orgTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("showSupport"), f3));
                orgTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("jobChance"), f3));
                orgTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("sayToSK"), f3));
                orgTable.addCell(cell);
                if (x % 11 == 0) {
                    count++;
                    record.add(new Paragraph(60, "\u00a0"));
                    record.add(orgTable);
                    orgTable = new PdfPTable(9);
                    orgTable.setWidthPercentage(100);
                    orgTable.setSpacingBefore(30f);
                    orgTable.setSpacingAfter(20f);
                    orgTable.setWidths(new int[]{1, 4, 3, 3, 3, 2, 4, 4, 4});
                    cell = new PdfPCell(new Phrase("ID", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    orgTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Name", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    orgTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Resident Voter", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    orgTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Member of Organization", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    orgTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Name of Organization", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    orgTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Support SK", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    orgTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Show Support", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    orgTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Job Chance", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    orgTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Say to SK", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    orgTable.addCell(cell);
                    //System.out.print("PDF.java inside if count: " + count);
//                    count++;
                }
                //System.out.print("PDF.java inside while count: " + count);
//                event.setTotalPageCount(count);
            }
            record.add(new Paragraph(60, "\u00a0"));
            record.add(orgTable);
            orgTable = new PdfPTable(9);
            orgTable.setWidthPercentage(100);
            orgTable.setSpacingBefore(30f);
            orgTable.setSpacingAfter(20f);
            orgTable.setWidths(new int[]{1, 4, 3, 3, 3, 2, 4, 4, 4});

            event.setTotalPageCount(count);
            record.newPage();
            event.setTotalPageCount(count);
            record.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void statusInfoRecord(ResultSet rs, String user, String filename, String path) {

//DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time
        String date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time

        Document record = new Document();
        record.setPageSize(PageSize.LEGAL.rotate());

        int count = 1;

        try {
            String home = System.getProperty("user.home");
            PdfWriter writer = PdfWriter.getInstance(record, new FileOutputStream("D:/Downloads/" + filename));

            record.open();

            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 9, Font.BOLD, BaseColor.WHITE);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 8);
            BaseColor columnHeaderColor = WebColors.getRGBColor("#8B3535");

            HeaderFooterPageEvent event = new HeaderFooterPageEvent(path);
            writer.setPageEvent((PdfPageEvent) event);
            event.setHeader("Header");
            event.setFooter("Footer");
            event.setDateAndTime(current);
            event.setUsername(user);

            PdfPTable statusTable = new PdfPTable(8);
            statusTable.setWidthPercentage(100);
            statusTable.setSpacingBefore(30f);
            statusTable.setSpacingAfter(20f);
            PdfPCell cell;
            statusTable.setWidths(new int[]{1, 4, 2, 5, 3, 4, 2, 3});
            cell = new PdfPCell(new Phrase("ID", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            statusTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Name", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            statusTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Civil Status", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            statusTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Working Status", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            statusTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Educational Attainment", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            statusTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Job Employed", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            statusTable.addCell(cell);
            cell = new PdfPCell(new Phrase("PWD", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            statusTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Type of Disability", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            statusTable.addCell(cell);

            int x = 0;
            while (rs.next()) {
                x++;
                cell = new PdfPCell(new Phrase(rs.getString("statusID"), f3));
                cell.setVerticalAlignment(Element.ALIGN_CENTER);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                statusTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("name"), f3));
                statusTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("civilStatus"), f3));
                statusTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("workingStatus"), f3));
                statusTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("educationAttainment"), f3));
                statusTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("jobEmployed"), f3));
                statusTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("PWD"), f3));
                statusTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("typeOfDisability"), f3));
                statusTable.addCell(cell);
                if (x % 30 == 0) {
                    count++;
                    record.add(new Paragraph(60, "\u00a0"));
                    record.add(statusTable);
                    statusTable = new PdfPTable(8);
                    statusTable.setWidthPercentage(100);
                    statusTable.setSpacingBefore(30f);
                    statusTable.setSpacingAfter(20f);
                    statusTable.setWidths(new int[]{1, 4, 2, 5, 3, 4, 2, 3});
                    cell = new PdfPCell(new Phrase("ID", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    statusTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Name", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    statusTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Civil Status", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    statusTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Working Status", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    statusTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Educational Attainment", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    statusTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Job Employed", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    statusTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("PWD", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    statusTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Type of Disability", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    statusTable.addCell(cell);

                    //System.out.print("PDF.java inside if count: " + count);
//                    count++;
                }
                //System.out.print("PDF.java inside while count: " + count);
//                event.setTotalPageCount(count);
            }
            record.add(new Paragraph(60, "\u00a0"));
            record.add(statusTable);
            statusTable = new PdfPTable(8);
            statusTable.setWidthPercentage(100);
            statusTable.setSpacingBefore(30f);
            statusTable.setSpacingAfter(20f);
            statusTable.setWidths(new int[]{1, 4, 2, 5, 3, 4, 2, 3});

            event.setTotalPageCount(count);
            record.newPage();
            event.setTotalPageCount(count);
            record.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void vaccInfoRecord(ResultSet rs, String user, String filename, String path) {

//DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time
        String date = dtf.format(current); //DateTimeFormatter pattern is implemented in the current date and time

        Document record = new Document();
        record.setPageSize(PageSize.LEGAL.rotate());

        int count = 1;

        try {
            String home = System.getProperty("user.home");
            PdfWriter writer = PdfWriter.getInstance(record, new FileOutputStream("D:/Downloads/" + filename));

            record.open();

            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 9, Font.BOLD, BaseColor.WHITE);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 8);
            BaseColor columnHeaderColor = WebColors.getRGBColor("#8B3535");

            HeaderFooterPageEvent event = new HeaderFooterPageEvent(path);
            writer.setPageEvent((PdfPageEvent) event);
            event.setHeader("Header");
            event.setFooter("Footer");
            event.setDateAndTime(current);
            event.setUsername(user);

            PdfPTable vaccineTable = new PdfPTable(6);
            vaccineTable.setWidthPercentage(100);
            vaccineTable.setSpacingBefore(30f);
            vaccineTable.setSpacingAfter(20f);
            PdfPCell cell;
            vaccineTable.setWidths(new int[]{1, 3, 3, 3, 3, 3});
            cell = new PdfPCell(new Phrase("ID", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            vaccineTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Name", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            vaccineTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Vaccinated", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            vaccineTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Willing for Vaccine", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            vaccineTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Brand of Vaccine", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            vaccineTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Vaccine Status", f2));
            cell.setVerticalAlignment(Element.ALIGN_CENTER);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setPadding(10);
            cell.setBackgroundColor(columnHeaderColor);
            vaccineTable.addCell(cell);

            int x = 0;
            while (rs.next()) {
                x++;
                cell = new PdfPCell(new Phrase(rs.getString("vaccineID"), f3));
                cell.setVerticalAlignment(Element.ALIGN_CENTER);
                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                vaccineTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("name"), f3));
                vaccineTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("vaccinated"), f3));
                vaccineTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("willingForVaccine"), f3));
                vaccineTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("brandOfVaccine"), f3));
                vaccineTable.addCell(cell);
                cell = new PdfPCell(new Phrase(rs.getString("vaccineStatus"), f3));
                vaccineTable.addCell(cell);
                if (x % 30 == 0) {
                    count++;
                    record.add(new Paragraph(60, "\u00a0"));
                    record.add(vaccineTable);
                    vaccineTable = new PdfPTable(6);
                    vaccineTable.setWidthPercentage(100);
                    vaccineTable.setSpacingBefore(30f);
                    vaccineTable.setSpacingAfter(20f);
                    vaccineTable.setWidths(new int[]{1, 3, 3, 3, 3, 3});
                    cell = new PdfPCell(new Phrase("ID", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    vaccineTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Name", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    vaccineTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Vaccinated", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    vaccineTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Willing for Vaccine", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    vaccineTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Brand of Vaccine", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    vaccineTable.addCell(cell);
                    cell = new PdfPCell(new Phrase("Vaccine Status", f2));
                    cell.setVerticalAlignment(Element.ALIGN_CENTER);
                    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
                    cell.setPadding(10);
                    cell.setBackgroundColor(columnHeaderColor);
                    vaccineTable.addCell(cell);

                    //System.out.print("PDF.java inside if count: " + count);
//                    count++;
                }
                //System.out.print("PDF.java inside while count: " + count);
//                event.setTotalPageCount(count);
            }
            record.add(new Paragraph(60, "\u00a0"));
            record.add(vaccineTable);
            vaccineTable = new PdfPTable(6);
            vaccineTable.setWidthPercentage(100);
            vaccineTable.setSpacingBefore(30f);
            vaccineTable.setSpacingAfter(20f);
            vaccineTable.setWidths(new int[]{1, 3, 3, 3, 3, 3});

            event.setTotalPageCount(count);
            record.newPage();
            event.setTotalPageCount(count);
            record.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
