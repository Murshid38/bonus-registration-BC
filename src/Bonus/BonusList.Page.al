page 65400 "MNB Bonus List"
{
    ApplicationArea = All;
    Caption = 'Bonuses';
    PageType = List;
    SourceTable = "MNB Bonus Header";
    UsageCategory = Lists;
    CardPageId = "MNB Bonus Card";

    layout
    {
        area(Content)
        {
            repeater(General)
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
}
