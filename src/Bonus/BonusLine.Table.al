table 65401 "MNB Bonus Line"
{
    DataClassification = ToBeClassified;
    Caption = 'Bonus Line';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "MNB Bonus Header";
            Caption = 'Document No.';

        }
        field(2; Type; enum "MNB Bonus Line Type")
        {
            DataClassification = CustomerContent;
            TableRelation = "MNB Bonus Header";
            Caption = 'Type';
        }
        field(3; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = if (Type = filter(Item)) Item;
            Caption = 'Item No.';
        }
        field(4; "Bonus Perc."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus Perc.';
            MinValue = 0;
            MaxValue = 100;
        }

    }

    keys
    {
        key(PK; "Document No.", Type, "Item No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        TestStatus();
    end;

    trigger OnModify()
    begin
        TestStatus();
    end;

    trigger OnDelete()
    begin
        TestStatus();
    end;

    trigger OnRename()
    begin
        TestStatus();
    end;

    var
        StatusIsReleasedErr: label 'Status can not be %1', Comment = '%1 is Status';

    local procedure TestStatus()
    var
        BonusHeader: Record "MNB Bonus Header";
    begin
        if BonusHeader.Status = BonusHeader.Status::Released then
            Error(StatusIsReleasedErr, BonusHeader.Status)
    end;
}
