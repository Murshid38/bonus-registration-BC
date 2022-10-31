pageextension 65400 "MNB Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("MNB No. of Bonuses"; Rec."MNB Bonuses")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number of bonuses';
            }
        }

    }

    actions
    {
        addlast(navigation)
        {
            action(MNBBonuses)
            //why this came in Related area
            {
                Caption = 'Bonuses';
                ToolTip = 'Opens the list of bonuses assigned to the customer.';
                ApplicationArea = All;
                Image = Discount;
                RunObject = page "MNB Bonus List";
                RunPageLink = "Customer No." = field("No.");
            }
        }
    }
}