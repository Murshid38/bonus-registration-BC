page 65402 "MNB Bonus Subform"
{
    Caption = 'Lines';
    PageType = ListPart;
    SourceTable = "MNB Bonus Line";

    layout
    {
        area(content)
        {
            repeater(Lines)
            {
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
                field("Bonus Perc."; Rec."Bonus Perc.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Bonus Perc. field.';
                }
            }
        }
    }
}
