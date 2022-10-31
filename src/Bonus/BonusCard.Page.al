page 65401 "MNB Bonus Card"
{
    Caption = 'Bonus Card';
    PageType = Document;
    SourceTable = "MNB Bonus Header";
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ending Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }

            part(Lines; "MNB Bonus Subform")
            {
                ApplicationArea = All;
                Caption = 'Lines';
                SubPageLink = "Document No." = field("No.");
                //how's these two can be equal??
            }
        }

    }

    actions
    {
        area(Navigation)
        {
            action("Customer Card")
            {
                ApplicationArea = All;
                ToolTip = 'Opens the Cusomer Card for the specified customer';
                Caption = 'Customer Card';
                Image = Customer;

                RunObject = page "Customer Card";
                //We are running the page "Customer Card" when action is clicked so we don't need a OnAction() trigger
                RunPageLink = "No." = field("Customer No.");
            }

            action(BonusEntries)
            {
                ApplicationArea = All;
                Caption = 'Bonus Entries';
                Image = Entry;
                RunObject = page "MNB Bonus Entries";
                RunPageLink = "Bonus No." = field("No.");
                ToolTip = 'Open bonus entries.  ';
            }
        }
    }

    trigger OnOpenPage()
    var
        a: Integer;
        b: Integer;
    begin
        a := 5;
        b := 7;

        if not (a > b) then Message('b is bigger than a');
    end;
}
