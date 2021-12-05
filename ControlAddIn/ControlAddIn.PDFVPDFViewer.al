controladdin "PDFV PDF Viewer"
{
    Scripts = 'https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js', 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.8.335/pdf.min.js', 'bc-pdf-viewer/JavaScript/script.js';
    StartupScript = 'bc-pdf-viewer/JavaScript/Startup.js';
    StyleSheets = 'bc-pdf-viewer/JavaScript/stylesheet.css';


    MinimumHeight = 1;
    MinimumWidth = 1;
    MaximumHeight = 2000;
    HorizontalStretch = true;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalShrink = true;
    event ControlAddinReady();
    event onView()
    procedure LoadPDF(PDFDocument: Text; IsFactbox: Boolean)
    procedure drawRectangle(x: Decimal; y: decimal; width: decimal; height: decimal);
    procedure SetVisible(IsVisible: Boolean)
}