permissionset 65400 "MNB Bonus Reg."
{
    Assignable = true;
    Caption = 'Bonus Registration';
    Permissions =
        tabledata "MNB Bonus Header" = RMID,
        tabledata "MNB Bonus Line" = RMID,
        tabledata "MNB Bonus Entry" = RMID;
}