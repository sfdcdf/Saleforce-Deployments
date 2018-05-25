public without sharing class ScheduleTORCHxOBCallController {

    private List<Case> scheduledOBCallCaseList = new List<Case>();
    private List<String> torchxOBCallSubjectList = new List<String>{'TORCHx CSC - Setup Call', 'Schedule your next call: Managing Relationships', 'Schedule your next call: Advanced Features', 'Schedule your next call: Monthly Review', 'Schedule your next call: Call Two', 'Schedule your next call: Call Three', 'Schedule your next call: Website Launch', 'Website Launch Call'};
    private Map<String, Time> timeStringTimeMap; //= new Map<String, Time>{'8:00am EST' => Time.newInstance(13, 0, 0, 0), '9:00am EST' => Time.newInstance(14, 0, 0, 0), '10:00am EST' => Time.newInstance(15, 0, 0, 0), '11:00am EST' => Time.newInstance(16, 0, 0, 0), '12:00pm EST' => Time.newInstance(17, 0, 0, 0), '1:00pm EST' => Time.newInstance(18, 0, 0, 0), '2:00pm EST' => Time.newInstance(19, 0, 0, 0) ,'3:00pm EST' => Time.newInstance(20, 0, 0, 0) ,'4:00pm EST' => Time.newInstance(21, 0, 0, 0) ,'5:00pm EST' => Time.newInstance(22, 0, 0, 0) ,'6:00pm EST' => Time.newInstance(23, 0, 0, 0) ,'7:00pm EST' => Time.newInstance(0, 0, 0, 0)};
    private Map<String, String> convertedESTTimeToLHWSPickListMap = new Map<String, String>{'08:00 AM' => '8:00am EST', '09:00 AM' => '9:00am EST', '10:00 AM' => '10:00am EST', '11:00 AM' => '11:00am EST', '12:00 PM' => '12:00pm EST', '01:00 PM' => '1:00pm EST', '02:00 PM' => '2:00pm EST', '03:00 PM' => '3:00pm EST', '04:00 PM' => '4:00pm EST', '05:00 PM' => '5:00pm EST', '06:00 PM' => '6:00pm EST', '07:00 PM' => '7:00pm EST'};

    private static BusinessHours localBusinessHours = [select Id, IsActive, Name, IsDefault, FridayEndTime, FridayStartTime, MondayEndTime, MondayStartTime, SaturdayEndTime, SaturdayStartTime, SundayEndTime, SundayStartTime, ThursdayEndTime, ThursdayStartTime, TimeZoneSidKey, TuesdayEndTime, TuesdayStartTime, WednesdayEndTime, WednesdayStartTime from BusinessHours where Name =: Label.TORCHxMedicalBusinessHourName];
    private static Set<String> weekendString = new Set<String>{'Saturday', 'Sunday'};
    private Map<String, Integer> torchxLimitMap; //AdjustCustomCodeLimit__c.getInstance('TORCHxScheduledOBCallLimit');

    private Map<String, Integer> dateTimeScheduleCount = new Map<String, Integer>();
    private Date selectedDate;

    public Map<String, AvailableDateTime> selectTempIdToAvailableDateTimeMap {get; set;}

    public Map<Date, List<AvailableDateTime>> businessHourDateTimeMap {get; set;}
    public Case dateCaseWorkAround {get; set;}
    public String selectedTimeZone {get; set;}
    public Account acct {get; set;}
    public Id selectedCaseId {get; set;}
    public Case selectedCase {get; set;}
    public String selectedAvailableTime {get; set;}
    public String scheduledCallFormat {get; set;}

    public Boolean savedCallSchedule {get; set;}

    public ScheduleTORCHxOBCallController() {
        populateTimeZoneOffsetForPicklistTimes();
        populateStartTimeLimit();
        dateCaseWorkAround = new Case();
        selectedDate = Date.today();
        savedCallSchedule = false;

        if(weekendString.contains(DateTime.now().format('EEEE')) || DateTime.now().format('EEEE') == 'Friday'){
            selectedDate = selectedDate.addDays(4).toStartOfWeek();
        }

        dateCaseWorkAround.StartDate__c = selectedDate;
        businessHourDateTimeMap = new Map<Date, List<AvailableDateTime>>();
        acct = new Account();
        selectedCase = new Case();

        selectTempIdToAvailableDateTimeMap = new Map<String, AvailableDateTime>();

        if(String.isNotBlank(ApexPages.currentPage().getParameters().get('salesforceAccountId'))){
            acct = [select Id, Name, tz__Timezone_IANA__c, (select Id, Subject, Scheduled_Call__c from Cases where Subject in: torchxOBCallSubjectList and Account.Product_Type_Transactional__c like '%TORCHx%' and IsClosed = false order by CreatedDate ASC) from Account where Id = : ApexPages.currentPage().getParameters().get('salesforceAccountId') limit 1];
            //selectedAccountId = acct.Id;
            selectedTimeZone = acct.tz__Timezone_IANA__c;
            if(String.isBlank(selectedCaseId) && !acct.Cases.isEmpty()){
                selectedCaseId = acct.Cases[0].Id;
                selectedCase = acct.Cases[0];
            }
            /*if(selectedCase.Scheduled_Call__c != null){
                scheduledCallFormat = selectedCase.Scheduled_Call__c.format('MM/dd/yyyy hh:mm a', selectedTimeZone);
            }*/
        }

        if(String.isBlank(selectedTimeZone)){
            selectedTimeZone = UserInfo.getTimeZone().getID();
        }

        if(selectedCase.Scheduled_Call__c != null){
            scheduledCallFormat = selectedCase.Scheduled_Call__c.format('MM/dd/yyyy hh:mm a', selectedTimeZone);
        }

        currentScheduledOBCalls();
        populateBusinessHoursMap();
        system.debug(businessHourDateTimeMap);
    }

    private void populateStartTimeLimit(){
        torchxLimitMap = new Map<String, Integer>();

        for(AdjustCustomCodeLimit__c record : AdjustCustomCodeLimit__c.getAll().values()){
            if(record.Name.contains('TORCHxMedicalOBCallLimit:')){
                torchxLimitMap.put(record.Name.remove('TORCHxMedicalOBCallLimit:').trim(), (Integer)record.Limit__c);
            }
        }
    }

    private void populateTimeZoneOffsetForPicklistTimes(){
        if(Timezone.getTimeZone('America/New_York').getOffset(Date.today())/3600000 == -4){
            timeStringTimeMap = new Map<String, Time>{'8:00am EST' => Time.newInstance(13, 0, 0, 0),'9:00am EST' => Time.newInstance(13, 0, 0, 0), '10:00am EST' => Time.newInstance(14, 0, 0, 0), '11:00am EST' => Time.newInstance(15, 0, 0, 0), '12:00pm EST' => Time.newInstance(16, 0, 0, 0), '1:00pm EST' => Time.newInstance(17, 0, 0, 0), '2:00pm EST' => Time.newInstance(18, 0, 0, 0) ,'3:00pm EST' => Time.newInstance(19, 0, 0, 0) ,'4:00pm EST' => Time.newInstance(20, 0, 0, 0) ,'5:00pm EST' => Time.newInstance(21, 0, 0, 0) ,'6:00pm EST' => Time.newInstance(22, 0, 0, 0) ,'7:00pm EST' => Time.newInstance(23, 0, 0, 0)};
        }else{
            timeStringTimeMap = new Map<String, Time>{'8:00am EST' => Time.newInstance(13, 0, 0, 0),'9:00am EST' => Time.newInstance(14, 0, 0, 0), '10:00am EST' => Time.newInstance(15, 0, 0, 0), '11:00am EST' => Time.newInstance(16, 0, 0, 0), '12:00pm EST' => Time.newInstance(17, 0, 0, 0), '1:00pm EST' => Time.newInstance(18, 0, 0, 0), '2:00pm EST' => Time.newInstance(19, 0, 0, 0) ,'3:00pm EST' => Time.newInstance(20, 0, 0, 0) ,'4:00pm EST' => Time.newInstance(21, 0, 0, 0) ,'5:00pm EST' => Time.newInstance(22, 0, 0, 0) ,'6:00pm EST' => Time.newInstance(23, 0, 0, 0) ,'7:00pm EST' => Time.newInstance(0, 0, 0, 0)};
        }
    }

    private void populateBusinessHoursMap(){
        //Set<String> weekendString = new Set<String>{'Saturday', 'Sunday'};
        selectTempIdToAvailableDateTimeMap.clear();

        for(Integer i = 0; i < 6; i++){
            Date dateNow = selectedDate.toStartOfWeek().addDays(i);
            DateTime dateTimeNow = DateTime.newInstance(dateNow, Time.newInstance(0, 0, 0, 0));

            if(i > 1 && weekendString.contains(dateTimeNow.format('EEEE'))){
                break;
            }

            if(!weekendString.contains(dateTimeNow.format('EEEE'))){
                Time startTime;
                Time endTime;

                if(dateTimeNow.format('EEEE') == 'Monday'){
                    startTime = localBusinessHours.MondayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(localBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
                    endTime = localBusinessHours.MondayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(localBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
                }else if(dateTimeNow.format('EEEE') == 'Tuesday'){
                    startTime = localBusinessHours.TuesdayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(localBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
                    endTime = localBusinessHours.TuesdayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(localBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
                }else if(dateTimeNow.format('EEEE') == 'Wednesday'){
                    startTime = localBusinessHours.WednesdayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(localBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
                    endTime = localBusinessHours.WednesdayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(localBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
                }else if(dateTimeNow.format('EEEE') == 'Thursday'){
                    startTime = localBusinessHours.ThursdayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(localBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
                    endTime = localBusinessHours.ThursdayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(localBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
                }else if(dateTimeNow.format('EEEE') == 'Friday'){
                    startTime = localBusinessHours.FridayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(localBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
                    endTime = localBusinessHours.FridayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(localBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
                }

                //userAvailableDateTimeMap.put(dateNow, new List<UserAvailableDateTime>());
                businessHourDateTimeMap.put(dateNow, new List<AvailableDateTime>());

                while(startTime.addMinutes(60) <= endTime){
                    //businessHourDateTimeMap.put(DateTime.newInstance(dateNow, startTime).format(), false);
                    AvailableDateTime avDT = new AvailableDateTime();
                    avDT.startDateTime = DateTime.newInstance(dateNow, startTime);
                    avDT.endDateTime = DateTime.newInstance(dateNow, startTime.addhours(1));

                    avDT.convertedStartTime = avDT.startDateTime.format('hh:mm a', selectedTimeZone);
                    avDT.convertedEndTime = avDT.startDateTime.addHours(1).format('hh:mm a', selectedTimeZone);

                    avDT.convertedStartTimeForLimitMap = avDT.startDateTime.format('hh:mm a', 'America/New_York');

                    avDT.selectDateTimeId = avDT.startDateTime.format();

                    avDT.availableDateTime = ((dateTimeScheduleCount.containsKey(avDT.startDateTime.format()) && torchxLimitMap.containsKey(avDT.convertedStartTimeForLimitMap) && dateTimeScheduleCount.get(avDT.startDateTime.format()) >= torchxLimitMap.get(avDT.convertedStartTimeForLimitMap)) || !torchxLimitMap.containsKey(avDT.convertedStartTimeForLimitMap) /*|| (dateTimeScheduleCount.containsKey(avDT.startDateTime.addMinutes(30).format()) && dateTimeScheduleCount.get(avDT.startDateTime.addMinutes(30).format()) >= torchxLimit.Limit__c)*/) ? false : true;

                    if(!BusinessHours.isWithin(localBusinessHours.Id, avDT.startDateTime)){
                        avDT.availableDateTime = false;
                    }

                    if(dateNow <= Date.today()){
                        avDT.availableDateTime = false;
                    }

                    businessHourDateTimeMap.get(dateNow).add(avDT);

                    selectTempIdToAvailableDateTimeMap.put(avDT.startDateTime.format(), avDT);

                    startTime = startTime.addMinutes(60);
                }
            }
        }
    }

    private void currentScheduledOBCalls(){
        dateTimeScheduleCount.clear();

        Date startDate = selectedDate.toStartOfWeek();
        Date endDate = startDate.addDays(7);

        for(Case record : [select Id, Scheduled_Call__c from Case where Subject in: torchxOBCallSubjectList and Scheduled_Call__c != null and Account.Product_Type_Transactional__c like '%TORCHx%' and IsClosed = false and Scheduled_Call__c >=: startDate and Scheduled_Call__c <=: endDate]){
            //businessHourDateTimeMap.put(record.Scheduled_Call__c.format(), true);
            //businessHourDateTimeMap.put(record.Scheduled_Call__c.addMinutes(30).format(), true);
            //scheduledOBCallCaseList.add(record);

            if(!dateTimeScheduleCount.containsKey(record.Scheduled_Call__c.format())){
                dateTimeScheduleCount.put(record.Scheduled_Call__c.format(), 0);
            }

            /*if(!dateTimeScheduleCount.containsKey(record.Scheduled_Call__c.addMinutes(30).format())){
                dateTimeScheduleCount.put(record.Scheduled_Call__c.addMinutes(30).format(), 0);
            }*/

            Integer startTimeAdded = dateTimeScheduleCount.get(record.Scheduled_Call__c.format()) + 1;
            //Integer halfTimeAdded = dateTimeScheduleCount.get(record.Scheduled_Call__c.addMinutes(30).format()) + 1;

            dateTimeScheduleCount.put(record.Scheduled_Call__c.format(), startTimeAdded);
            //dateTimeScheduleCount.put(record.Scheduled_Call__c.addMinutes(30).format(), halfTimeAdded);
        }

        for(Case record : [select Id, CSC_Reschedule_Date_2__c from Case where RecordType.Name = 'TORCHx NCS - AutoLaunch' and Web_Dev_Score_for_IMS__c = TODAY and CSC_Reschedule_Date_2__c >=: startDate and CSC_Reschedule_Date_2__c <=: endDate]){
            if(!dateTimeScheduleCount.containsKey(record.CSC_Reschedule_Date_2__c.format())){
                dateTimeScheduleCount.put(record.CSC_Reschedule_Date_2__c.format(), 0);
            }

            Integer startTimeAdded = dateTimeScheduleCount.get(record.CSC_Reschedule_Date_2__c.format()) + 1;

            dateTimeScheduleCount.put(record.CSC_Reschedule_Date_2__c.format(), startTimeAdded);
        }

        for(Lighthouse_Worksheets__c record : [select Id, CSC_Date__c, CSC_Time__c from Lighthouse_Worksheets__c where RecordType.Name in ('CSC Worksheet - Dental', 'CSC Worksheet - Medical', 'AR Request Form', 'CSC Worksheet - Auto') and CSC_Date__c != null and CSC_Time__c != '' and CSC_Date__c >=: startDate and CSC_Date__c <=: endDate]){
            if(timeStringTimeMap.containsKey(record.CSC_Time__c)){
                DateTime scheduleCallDateTime = DateTime.newInstanceGMT(record.CSC_Date__c, timeStringTimeMap.get(record.CSC_Time__c));

                if(record.CSC_Time__c.equalsIgnoreCase('7:00pm EST') && Timezone.getTimeZone('America/New_York').getOffset(Date.today())/3600000 == -5){
                    scheduleCallDateTime = scheduleCallDateTime.addDays(1);
                }

                if(!dateTimeScheduleCount.containsKey(scheduleCallDateTime.format())){
                    dateTimeScheduleCount.put(scheduleCallDateTime.format(), 0);
                }

                Integer startTimeAdded = dateTimeScheduleCount.get(scheduleCallDateTime.format()) + 1;

                dateTimeScheduleCount.put(scheduleCallDateTime.format(), startTimeAdded);
            }
        }

        system.debug(dateTimeScheduleCount);
    }

    public List<SelectOption> getOpenCases() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('','-none-'));
        for(Case record : acct.Cases){
            options.add(new SelectOption(record.Id, record.Subject));
        }

        /*if(String.isBlank(selectedCaseId) && !acct.Cases.isEmpty()){
            selectedCaseId = acct.Cases[0].Id;
            selectedCase = acct.Cases[0];
        }else if(selectedCaseId != selectedCase.Id){
            selectedCase = [select Id, Subject, Scheduled_Call__c from Case where Id =: selectedCaseId];
        }*/

        return options;
    }

    public List<SelectOption> getSupportedTimeZone() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('GMT','(GMT+00:00) Greenwich Mean Time (GMT)'));
        options.add(new SelectOption('Atlantic/Cape_Verde','(GMT'+Timezone.getTimeZone('Atlantic/Cape_Verde').getOffset(Date.today())/3600000+':00) Cape Verde Time (Atlantic/Cape_Verde)'));
        options.add(new SelectOption('America/Sao_Paulo','(GMT'+Timezone.getTimeZone('America/Sao_Paulo').getOffset(Date.today())/3600000+':00) Brasilia Summer Time (America/Sao_Paulo)'));
        options.add(new SelectOption('Atlantic/South_Georgia','(GMT'+Timezone.getTimeZone('Atlantic/South_Georgia').getOffset(Date.today())/3600000+':00) South Georgia Time (Atlantic/South_Georgia)'));
        options.add(new SelectOption('America/Argentina/Buenos_Aires','(GMT'+Timezone.getTimeZone('America/Buenos_Aires').getOffset(Date.today())/3600000+':00) Argentina Time (America/Argentina/Buenos_Aires)'));
        options.add(new SelectOption('America/Santiago','(GMT'+Timezone.getTimeZone('America/Santiago').getOffset(Date.today())/3600000+':00) Chile Summer Time (America/Santiago)'));
        options.add(new SelectOption('America/St_Johns','(GMT'+Timezone.getTimeZone('America/St_Johns').getOffset(Date.today())/3600000+':30) Newfoundland Standard Time (America/St_Johns)'));
        options.add(new SelectOption('America/Halifax','(GMT'+Timezone.getTimeZone('America/Halifax').getOffset(Date.today())/3600000+':00) Atlantic Standard Time (America/Halifax)'));
        options.add(new SelectOption('America/Puerto_Rico','(GMT'+Timezone.getTimeZone('America/Puerto_Rico').getOffset(Date.today())/3600000+':00) Atlantic Standard Time (America/Puerto_Rico)'));
        options.add(new SelectOption('Atlantic/Bermuda','(GMT'+Timezone.getTimeZone('Atlantic/Bermuda').getOffset(Date.today())/3600000+':00) Atlantic Standard Time (Atlantic/Bermuda)'));
        options.add(new SelectOption('America/Caracas','(GMT'+Timezone.getTimeZone('America/Caracas').getOffset(Date.today())/3600000+':30) Venezuela Time (America/Caracas)'));
        options.add(new SelectOption('America/Bogota','(GMT'+Timezone.getTimeZone('America/Bogota').getOffset(Date.today())/3600000+':00) Colombia Time (America/Bogota)'));
        options.add(new SelectOption('America/Indiana/Indianapolis','(GMT'+Timezone.getTimeZone('America/Indiana/Indianapolis').getOffset(Date.today())/3600000+':00) Eastern Standard Time (America/Indiana/Indianapolis)'));
        options.add(new SelectOption('America/Lima','(GMT'+Timezone.getTimeZone('America/Lima').getOffset(Date.today())/3600000+':00) Peru Time (America/Lima)'));
        options.add(new SelectOption('America/New_York','(GMT'+Timezone.getTimeZone('America/New_York').getOffset(Date.today())/3600000+':00) Eastern Standard Time (America/New_York)'));
        options.add(new SelectOption('America/Panama','(GMT'+Timezone.getTimeZone('America/Panama').getOffset(Date.today())/3600000+':00) Eastern Standard Time (America/Panama)'));
        options.add(new SelectOption('America/Chicago','(GMT'+Timezone.getTimeZone('America/Chicago').getOffset(Date.today())/3600000+':00) Central Standard Time (America/Chicago)'));
        options.add(new SelectOption('America/El_Salvador','(GMT'+Timezone.getTimeZone('America/El_Salvador').getOffset(Date.today())/3600000+':00) Central Standard Time (America/El_Salvador)'));
        options.add(new SelectOption('America/Mexico_City','(GMT'+Timezone.getTimeZone('America/Mexico_City').getOffset(Date.today())/3600000+':00) Central Standard Time (America/Mexico_City)'));
        options.add(new SelectOption('America/Denver','(GMT'+Timezone.getTimeZone('America/Denver').getOffset(Date.today())/3600000+':00) Mountain Standard Time (America/Denver)'));
        options.add(new SelectOption('America/Phoenix','(GMT'+Timezone.getTimeZone('America/Phoenix').getOffset(Date.today())/3600000+':00) Mountain Standard Time (America/Phoenix)'));
        options.add(new SelectOption('America/Los_Angeles','(GMT'+Timezone.getTimeZone('America/Los_Angeles').getOffset(Date.today())/3600000+':00) Pacific Standard Time (America/Los_Angeles)'));
        options.add(new SelectOption('America/Tijuana','(GMT'+Timezone.getTimeZone('America/Tijuana').getOffset(Date.today())/3600000+':00) Pacific Standard Time (America/Tijuana)'));
        options.add(new SelectOption('America/Anchorage','(GMT'+Timezone.getTimeZone('America/Anchorage').getOffset(Date.today())/3600000+':00) Alaska Standard Time (America/Anchorage)'));
        options.add(new SelectOption('Pacific/Honolulu','(GMT'+Timezone.getTimeZone('Pacific/Honolulu').getOffset(Date.today())/3600000+':00) Hawaii-Aleutian Standard Time (Pacific/Honolulu)'));

        return options;
    }

    public void selectDateFilter(){
        selectedDate = dateCaseWorkAround.StartDate__c;
        businessHourDateTimeMap = new Map<Date, List<AvailableDateTime>>();
        if(String.isNotBlank(selectedCaseId) && selectedCaseId != selectedCase.Id){
            selectedCase = [select Id, Subject, Scheduled_Call__c from Case where Id =: selectedCaseId];
        }else if(String.isBlank(selectedCaseId)){
            selectedCase = new Case();
        }
        if(selectedCase.Scheduled_Call__c != null){
            scheduledCallFormat = selectedCase.Scheduled_Call__c.format('MM/dd/yyyy hh:mm a', selectedTimeZone);
        }else{
            scheduledCallFormat = '';
        }
        //populateStartTimeLimit();
        currentScheduledOBCalls();
        populateBusinessHoursMap();
    }

    public PageReference scheduleDateTime(){
        DateTime startDT = selectTempIdToAvailableDateTimeMap.get(selectedAvailableTime).startDateTime;
        DateTime endDT = selectTempIdToAvailableDateTimeMap.get(selectedAvailableTime).endDateTime;

        Date startDateSpecific = startDT.date();

        Integer validateLimitCount = [select Id from Case where Id != :selectedCase.Id and Subject in: torchxOBCallSubjectList and Scheduled_Call__c != null and Account.Product_Type_Transactional__c like '%TORCHx%' and IsClosed = false and Scheduled_Call__c >=: startDT and Scheduled_Call__c <: endDT].size();

        validateLimitCount += [select Id, CSC_Reschedule_Date_2__c from Case where RecordType.Name = 'TORCHx NCS - AutoLaunch' and Web_Dev_Score_for_IMS__c = TODAY and CSC_Reschedule_Date_2__c >=: startDT and CSC_Reschedule_Date_2__c <=: endDT].size();

        if(convertedESTTimeToLHWSPickListMap.containsKey(selectTempIdToAvailableDateTimeMap.get(selectedAvailableTime).convertedStartTimeForLimitMap)){
            validateLimitCount += [select Id, CSC_Date__c, CSC_Time__c from Lighthouse_Worksheets__c where RecordType.Name in ('CSC Worksheet - Dental', 'CSC Worksheet - Medical', 'AR Request Form', 'CSC Worksheet - Auto') and CSC_Date__c != null and CSC_Time__c != '' and CSC_Date__c =: startDT.date() and CSC_Time__c =: convertedESTTimeToLHWSPickListMap.get(selectTempIdToAvailableDateTimeMap.get(selectedAvailableTime).convertedStartTimeForLimitMap)].size();
        }
        if(validateLimitCount >= torchxLimitMap.get(selectTempIdToAvailableDateTimeMap.get(selectedAvailableTime).convertedStartTimeForLimitMap)){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, Label.TORCHxScheduleTimeNotAvailableError);
            ApexPages.addMessage(myMsg);
            selectedAvailableTime = '';
            selectDateFilter();
            return null;
        }

        selectedCase.Scheduled_Call__c = selectTempIdToAvailableDateTimeMap.get(selectedAvailableTime).startDateTime;
        update selectedCase;

        savedCallSchedule = true;

        selectDateFilter();

        PageReference pageRef = Page.TORCHxThankYou;
        pageRef.setRedirect(true);

        return pageRef;
    }

    public class AvailableDateTime {
        public String convertedStartTime {get; set;}
        public String convertedEndTime {get; set;}
        public String convertedStartTimeForLimitMap {get; set;}
        public DateTime startDateTime {get; set;}
        public DateTime endDateTime {get; set;}
        public Boolean availableDateTime {get; set;}
        public String selectDateTimeId {get; set;}
    }
}