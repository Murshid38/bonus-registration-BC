page 65403 "MNB Bonus Entries"
{
    ApplicationArea = All;
    Caption = 'Bonus Entries';
    PageType = List;
    SourceTable = "MNB Bonus Entry";
    UsageCategory = History;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Bonus No."; Rec."Bonus No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bonus No. field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Bonus Amount"; Rec."Bonus Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bouns Amount field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
            }
        }
    }
}
