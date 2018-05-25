trigger PopulateMostEligibleContact on Contact (after Update, after Insert) {
    List<Contact> lstContactsWithPhone = new List<Contact>();

    if(Trigger.IsUpdate){
        for(Contact con : Trigger.New){
            if(
                (
                    con.AccountId != NULL &&
                    (
                        (
                            con.Phone != NULL &&
                            con.Phone != Trigger.OldMap.get(con.Id).Phone
                        ) ||
                        (
                            con.MobilePhone != NULL &&
                            con.MobilePhone != Trigger.OldMap.get(con.Id).MobilePhone
                        ) ||
                        (
                            con.OtherPhone != NULL &&
                            con.OtherPhone != Trigger.OldMap.get(con.Id).OtherPhone
                        )
                    )
                ) ||
                (
                    con.AccountId != NULL &&
                    con.AccountId != Trigger.OldMap.get(con.Id).AccountId
                )
            ){
                lstContactsWithPhone.add(con);
            }
        }
    }
    else if(Trigger.IsInsert){
        for(Contact con : Trigger.New){
            if(
                (
                    con.Phone != NULL ||
                    con.MobilePhone != NULL ||
                    con.OtherPhone != NULL
                ) &&
                con.AccountId != NULL
            ){
                lstContactsWithPhone.add(con);
            }
        }
    }

    if(!lstContactsWithPhone.isEmpty())
        YodleUtilities.flagEligibleContact(lstContactsWithPhone);
}