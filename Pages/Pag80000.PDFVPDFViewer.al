page 82005 "PDFV PDF Viewer"
{

    Caption = 'PDF Viewer';
    PageType = Card;
    UsageCategory = None;
    SourceTable = "integer";
    layout
    {
        area(content)
        {
            group(General)
            {
                ShowCaption = false;
                usercontrol(PDFViewer; "PDFV PDF Viewer")
                {
                    ApplicationArea = All;

                    trigger ControlAddinReady()
                    begin
                        SetPDFDocument();
                    end;
                }
            }
        }
    }
    local procedure SetPDFDocument()
    var

    begin


        CurrPage.PDFViewer.SetVisible(PDFAsTxt <> '');
        if PDFAsTxt = '' then exit;


        CurrPage.PDFViewer.LoadPDF(PDFAsTxt, false);
        //CurrPage.PDFViewer.drawRectangle();
    end;

    procedure SetPDFText(PDFBase64: text)
    begin
        clear(PDFAsTxt);
        PDFAsTxt := PDFBase64
    end;

    var
        PDFAsTxt: Text;
}
