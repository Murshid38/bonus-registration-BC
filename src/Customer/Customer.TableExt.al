tableextension 65400 "MNB Customer" extends Customer
{
    fields
    {
        field(65400; "MNB Bonuses"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("MNB Bonus Header" where("Customer No." = field("No.")));
            Caption = 'MNB Bonuses';
            Editable = false;
        }
    }

    trigger OnBeforeDelete()
    begin
        TestIfBonusExists();
    end;

    local procedure TestIfBonusExists()
    var
        BonusHeader: Record "MNB Bonus Header";
        AtleastOneBonusForCustomerExistErr: label 'Atleast one bonus for customer %1', Comment = '%1 - Customer Name';
    begin
        BonusHeader.SetRange("Customer No.", Rec."No.");
        if not BonusHeader.IsEmpty then
            Error(AtleastOneBonusForCustomerExistErr, Rec.Name);
    end;

}
