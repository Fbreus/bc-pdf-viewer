page 82004 "PDFV PDF Viewer Factbox"
{

    Caption = 'PDF Viewer';
    PageType = CardPart;
    SourceTable = "integer";
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;

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

                    trigger onView()
                    begin
                        RunFullView();
                    end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(PDFVViewFullDocument)
            {
                ApplicationArea = All;
                Image = View;
                Caption = 'View';
                ToolTip = 'View';
                PromotedOnly = true;
                PromotedIsBig = true;
                PromotedCategory = Process;
                Promoted = true;
                trigger OnAction()
                begin
                    RunFullView();
                end;
            }
        }
    }
    local procedure SetPDFDocument()
    var
        Base64Convert: Codeunit "Base64 Convert";


    begin

        //PDFAsTxt := Base64Convert.ToBase64(PDFInstream);

        CurrPage.PDFViewer.LoadPDF(PDFAsTxt, true);
    end;

    procedure SetRecord()
    begin
        Rec.SetRange(Number, 1);
        if not Rec.FindFirst() then
            exit;
        SetPDFDocument();
        CurrPage.Update(false);
    end;

    procedure SetRecordWithBoundingBox(BoundingBoxObject: JsonObject)
    var
        OCRAPIMg: Codeunit "OCR API Mg";
        X: decimal;
        y: Decimal;
        width: decimal;
        height: decimal;

    begin
        Rec.SetRange(Number, 1);
        if not Rec.FindFirst() then
            exit;
        SetPDFDocument();
        OCRAPIMg.CalculateBoundingBoxValue(x, y, width, height, BoundingBoxObject);
        CurrPage.PDFViewer.drawRectangle(x, y, width, height);
        CurrPage.Update(false);
    end;


    local procedure RunFullView()
    var
        PDFViewerCard: Page "PDFV PDF Viewer";
    begin
        PDFViewerCard.SetRecord(Rec);
        PDFViewerCard.SetPDFText(PDFAsTxt);
        PDFViewerCard.SetTableView(rec);
        PDFViewerCard.Run();
    end;

    procedure SetInstreamVar(var InstreamVar: instream)
    var
        Tempblob: Codeunit "Temp Blob";
        Base64Convert: Codeunit "Base64 Convert";
        PDFOutstream: OutStream;
    begin
        clear(PDFInstream);
        Tempblob.CreateOutStream(PDFOutstream);
        CopyStream(PDFOutstream, InstreamVar);
        Tempblob.CreateInStream(PDFInstream);



        PDFAsTxt := Base64Convert.ToBase64(PDFInstream);
    end;



    var
        PDFAsTxt: text;
        PDFInstream: InStream;


}
