/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Raphaelle
 */
public class HeaderFooterForALL extends PdfPageEventHelper {

    LocalDateTime date;
    PdfPTable headTable;
    Image image;
    String name, dateAndTime, role;
    int total;
    float headTableHeight;
    String imagePath;

    public HeaderFooterForALL(String logoPath, String name, String role) {
        imagePath = logoPath;
        this.name = name;
        this.role = role;
        headTableHeight = 70;
    }

    public void setTotalPageCount(int total) {
        this.total = total;
    }

    public void setDateAndTime(LocalDateTime date) {
        DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("MM/dd/yyyy hh:mm a");
        dateAndTime = date.format(formatDate);
    }

    public float getTableHeight() {
        return headTableHeight;
    }

    public void onEndPage(PdfWriter writer, Document document) {
        try {
            Font FONT = new Font(Font.FontFamily.HELVETICA, 45, Font.BOLD, new GrayColor(0.85f));
            Image headerImg = Image.getInstance(imagePath);
            headerImg.setAbsolutePosition(510, 930);
            headerImg.scaleToFit(70, 70);
            document.add(headerImg);
            Font ffont = new Font(Font.FontFamily.HELVETICA, 10, Font.NORMAL);
            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);

            PdfContentByte cb = writer.getDirectContent();
            String x = String.valueOf(writer.getPageNumber());
            String y = String.valueOf(total);

            headTable = new PdfPTable(1);
            headTable.setTotalWidth(523);
            headTable.setLockedWidth(true);
            headTable.setSpacingAfter(20f);
            PdfPCell cell;
            cell = new PdfPCell(new Phrase("Exported by: " + name, ffont));
            cell.setBorder(Rectangle.NO_BORDER);
            headTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Position: " + role, ffont));
            cell.setBorder(Rectangle.NO_BORDER);
            headTable.addCell(cell);

            cell = new PdfPCell(new Phrase("Date and Time Exported: " + dateAndTime, ffont));
            cell.setBorder(Rectangle.NO_BORDER);
            headTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Database Report", f));
            cell.setBorder(Rectangle.NO_BORDER);
            headTable.addCell(cell);
            headTableHeight = headTable.getTotalHeight();

            Phrase footer = new Phrase(String.format("Page %s", x), ffont);

            headTable.writeSelectedRows(0, -1,
                    document.left(),
                    document.top() + ((document.topMargin() + headTableHeight) / 2),
                    writer.getDirectContent());

            ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT,
                    footer,
                    (document.right()),
                    document.bottom() - 10, 0);

            ColumnText.showTextAligned(writer.getDirectContentUnder(),
                    Element.ALIGN_CENTER, new Phrase("Sangguniang Kabataan Ibayo-Tipas", FONT),
                    310f, 520, 45);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
