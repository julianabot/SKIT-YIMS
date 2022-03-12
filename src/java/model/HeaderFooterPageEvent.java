package model;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

public class HeaderFooterPageEvent extends PdfPageEventHelper {

    LocalDateTime date;
    Image image;
    String header, footer, name, dateAndTime;
    int total;
    String imagePath;

    public HeaderFooterPageEvent(String logoPath) {
        imagePath = logoPath;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public void setFooter(String footer) {
        this.footer = footer;
    }

    public void setUsername(String name) {
        this.name = name;
    }

    public void setTotalPageCount(int total) {
        this.total = total;
    }

    public void setDateAndTime(LocalDateTime date) {
        DateTimeFormatter formatDate = DateTimeFormatter.ofPattern("MM/dd/yyyy hh:mm a");
        dateAndTime = date.format(formatDate);
    }

    public void onEndPage(PdfWriter writer, Document document) {
        try {
            Image headerImg = Image.getInstance(imagePath);
            headerImg.setAbsolutePosition(900, 530);
            headerImg.scaleToFit(70, 70);
            document.add(headerImg);
            Font ffont = new Font(Font.FontFamily.UNDEFINED, 10, Font.ITALIC);
            Font f = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLACK);

            PdfContentByte cb = writer.getDirectContent();
            String x = String.valueOf(writer.getPageNumber());
            //String y = String.valueOf(total);
            //System.out.print("Page event count: " + y);

            PdfPTable headTable = new PdfPTable(1);
            headTable.setTotalWidth(523);
            headTable.setLockedWidth(true);
            headTable.setSpacingAfter(20f);
            PdfPCell cell;
            cell = new PdfPCell(new Phrase("Exported by: " + name));
            cell.setBorder(Rectangle.NO_BORDER);
            headTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Position: Dev"));
            cell.setBorder(Rectangle.NO_BORDER);
            headTable.addCell(cell);

            cell = new PdfPCell(new Phrase("Date and Time Exported: " + dateAndTime));
            cell.setBorder(Rectangle.NO_BORDER);
            headTable.addCell(cell);
            cell = new PdfPCell(new Phrase("Database Report", f));
            cell.setBorder(Rectangle.NO_BORDER);
            headTable.addCell(cell);
            float headTableHeight = headTable.getTotalHeight();

            Phrase footer = new Phrase(String.format("Page %s", x), ffont);

            headTable.writeSelectedRows(0, -1,
                    document.left(),
                    document.top() + ((document.topMargin() + headTableHeight) / 4),
                    writer.getDirectContent());

            ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT,
                    footer,
                    (document.right()),
                    document.bottom() - 10, 0);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
