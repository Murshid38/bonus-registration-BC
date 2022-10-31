table 65400 "MNB Bonus Header"
{
    DataClassification = CustomerContent;
    Caption = 'Bonus';
    DrillDownPageId = "MNB Bonus List";
    LookupPageId = "MNB Bonus List";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
            Caption = 'Customer No.';

            trigger OnValidate()
            begin
                TestStatus();
            end;
        }

        field(3; "Starting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Starting Date';

            trigger OnValidate()
            begin
                TestStatus();
                if "Ending Date" < "Starting Date" then
                    "Ending Date" := "Starting Date";
            end;
        }
        field(4; "Ending Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Ending Date';

            trigger OnValidate()
            begin
                TestStatus();
                if "Ending Date" < "Starting Date" then
                    "Starting Date" := "Ending Date";
            end;
        }
        field(5; "Status"; enum "MNB Bonus Header Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        TestStatus();
        DeleteLines();
    end;

    var
        StatusIsReleasedErr: label 'Status can not be %1', Comment = '%1 is Status';

    local procedure TestStatus()
    begin
        if Status = Status::Released then
            Error(StatusIsReleasedErr, Status)
    end;

    local procedure DeleteLines()
    var
        BonusLine: Record "MNB Bonus Line";
    begin
        BonusLine.SetRange("Document No.", "No.");
        BonusLine.Delete();
    end;
}