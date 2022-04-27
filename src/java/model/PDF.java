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

    public void basicInfoRecord(ResultSet rs, String user, String role, String filename, String path) {
        LocalDateTime current = LocalDateTime.now();

        Document record = new Document();
        record.setPageSize(PageSize.LEGAL.rotate());
        record.setMargins(30, 30, 20, 30);
        int count = 1;

        try {
            String home = System.getProperty("user.home");
            PdfWriter writer = PdfWriter.getInstance(record, new FileOutputStream(home + "/Desktop/" + filename));
            writer.setFullCompression();

            HeaderFooterPageEvent event = new HeaderFooterPageEvent(path, user, role);
            record.setMargins(30, 30, 20 + event.getTableHeight(), 30);
            writer.setPageEvent((PdfPageEvent) event);

            event.setDateAndTime(current);

            record.open();

            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.WHITE);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
            BaseColor columnHeaderColor = WebColors.getRGBColor("#8B3535");

            PdfPTable basicTable = new PdfPTable(6);
            basicTable.setWidthPercentage(100);
            PdfPCell cell;
            basicTable.setWidths(new int[]{1, 4, 3, 2, 6, 3});
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

            basicTable.setHeaderRows(1);

            int x = 0;
            while (rs.next()) {
                x++;
                cell = new PdfPCell(new Phrase(rs.getString("residentID")));
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
                if (x % 16 == 0) {
                    count++;
                }
            }
            record.add(basicTable);
            record.newPage();
            record.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void contactInfoRecord(ResultSet rs, String user, String role, String filename, String path) {
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time

        Document record = new Document();
        record.setPageSize(PageSize.LEGAL.rotate());
        record.setMargins(30, 30, 20, 30);
//        ByteArrayOutputStream pdf = new ByteArrayOutputStream();
        int count = 1;

        try {
            String home = System.getProperty("user.home");
            PdfWriter writer = PdfWriter.getInstance(record, new FileOutputStream(home + "/Desktop/" + filename));

            HeaderFooterPageEvent event = new HeaderFooterPageEvent(path, user, role);
            record.setMargins(30, 30, 20 + event.getTableHeight(), 30);
            writer.setPageEvent((PdfPageEvent) event);

            event.setDateAndTime(current);

            record.open();

            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.WHITE);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);
            BaseColor columnHeaderColor = WebColors.getRGBColor("#8B3535");

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

            contactTable.setHeaderRows(1);

            int x = 0;
            while (rs.next()) {
                x++;
                cell = new PdfPCell(new Phrase(rs.getString("residentID")));
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
                if (x % 28 == 0) {
                    count++;
                }
            }

            record.add(contactTable);
            record.newPage();
            record.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void familyInfoRecord(ResultSet rs, String user, String role, String filename, String path) {
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time

        Document record = new Document();
        record.setPageSize(PageSize.LEGAL.rotate());
        record.setMargins(30, 30, 20, 30);
//        ByteArrayOutputStream pdf = new ByteArrayOutputStream();
        int count = 0;

        try {
            String home = System.getProperty("user.home");
            PdfWriter writer = PdfWriter.getInstance(record, new FileOutputStream(home + "/Desktop/" + filename));

            HeaderFooterPageEvent event = new HeaderFooterPageEvent(path, user, role);
            record.setMargins(30, 30, 20 + event.getTableHeight(), 30);
            writer.setPageEvent((PdfPageEvent) event);

            event.setDateAndTime(current);

            record.open();

            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 9, Font.BOLD, BaseColor.WHITE);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 8);
            BaseColor columnHeaderColor = WebColors.getRGBColor("#8B3535");

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

            familyTable.setHeaderRows(1);

            int x = 0;
            while (rs.next()) {
                x++;
                cell = new PdfPCell(new Phrase(rs.getString("residentID"), f3));
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
                if (x % 13 == 0) {
                    count++;
                }
            }
            record.add(familyTable);
            record.newPage();
            record.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void orgInfoRecord(ResultSet rs, String user, String role, String filename, String path) {
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time

        Document record = new Document();
        record.setPageSize(PageSize.LEGAL.rotate());
        record.setMargins(30, 30, 20, 30);
//        ByteArrayOutputStream pdf = new ByteArrayOutputStream();
        int count = 1;

        try {
            String home = System.getProperty("user.home");
            PdfWriter writer = PdfWriter.getInstance(record, new FileOutputStream(home + "/Desktop/" + filename));

            HeaderFooterPageEvent event = new HeaderFooterPageEvent(path, user, role);
            record.setMargins(30, 30, 20 + event.getTableHeight(), 30);
            writer.setPageEvent((PdfPageEvent) event);

            event.setDateAndTime(current);

            record.open();

            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 9, Font.BOLD, BaseColor.WHITE);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 8);
            BaseColor columnHeaderColor = WebColors.getRGBColor("#8B3535");

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

            orgTable.setHeaderRows(1);

            int x = 0;
            while (rs.next()) {
                x++;
                cell = new PdfPCell(new Phrase(rs.getString("residentID"), f3));
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
                if (x % 4 == 0) {
                    count++;
                }
            }
            record.add(orgTable);
            record.newPage();
            record.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void statusInfoRecord(ResultSet rs, String user, String role, String filename, String path) {
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time

        Document record = new Document();
        record.setPageSize(PageSize.LEGAL.rotate());
        record.setMargins(30, 30, 20, 30);
//        ByteArrayOutputStream pdf = new ByteArrayOutputStream();
        int count = 1;

        try {
            String home = System.getProperty("user.home");
            PdfWriter writer = PdfWriter.getInstance(record, new FileOutputStream(home + "/Desktop/" + filename));

            HeaderFooterPageEvent event = new HeaderFooterPageEvent(path, user, role);
            record.setMargins(30, 30, 20 + event.getTableHeight(), 30);
            writer.setPageEvent((PdfPageEvent) event);

            event.setDateAndTime(current);

            record.open();

            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 9, Font.BOLD, BaseColor.WHITE);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 8);
            BaseColor columnHeaderColor = WebColors.getRGBColor("#8B3535");

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

            statusTable.setHeaderRows(1);

            int x = 0;
            while (rs.next()) {
                x++;
                cell = new PdfPCell(new Phrase(rs.getString("residentID"), f3));
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
                if (x % 37 == 0) {
                    count++;
                }
            }
            record.add(statusTable);
            record.newPage();
            record.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void vaccInfoRecord(ResultSet rs, String user, String role, String filename, String path) {
        //DateTimeFormatter is used to set the format of the current date
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        LocalDateTime current = LocalDateTime.now(); //Gets the current date and time

        Document record = new Document();
        record.setPageSize(PageSize.LEGAL.rotate());
        record.setMargins(30, 30, 20, 30);
//        ByteArrayOutputStream pdf = new ByteArrayOutputStream();
        int count = 1;

        try {
            String home = System.getProperty("user.home");
            PdfWriter writer = PdfWriter.getInstance(record, new FileOutputStream(home + "/Desktop/" + filename));

            HeaderFooterPageEvent event = new HeaderFooterPageEvent(path, user, role);
            record.setMargins(30, 30, 20 + event.getTableHeight(), 30);
            writer.setPageEvent((PdfPageEvent) event);

            event.setDateAndTime(current);

            record.open();

            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);
            Font f2 = new Font(Font.FontFamily.HELVETICA, 9, Font.BOLD, BaseColor.WHITE);
            Font f3 = new Font(Font.FontFamily.HELVETICA, 8);
            BaseColor columnHeaderColor = WebColors.getRGBColor("#8B3535");

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

            vaccineTable.setHeaderRows(1);

            int x = 0;
            while (rs.next()) {
                x++;
                cell = new PdfPCell(new Phrase(rs.getString("residentID"), f3));
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
                if (x % 38 == 0) {
                    count++;
                }
            }
            record.add(vaccineTable);
            record.newPage();
            record.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
