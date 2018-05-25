public without sharing class WBNScheduleTouchpointController {

	private static BusinessHours ybnBusinessHours = [select Id, IsActive, Name, IsDefault, FridayEndTime, FridayStartTime, MondayEndTime, MondayStartTime, SaturdayEndTime, SaturdayStartTime, SundayEndTime, SundayStartTime, ThursdayEndTime, ThursdayStartTime, TimeZoneSidKey, TuesdayEndTime, TuesdayStartTime, WednesdayEndTime, WednesdayStartTime from BusinessHours where Name = 'WBN AutoTP Hours'];

	public Map<Date, List<UserAvailableDateTime>> userAvailableDateTimeMap {get; set;}
	private Map<String, UserAvailableDateTime> dateTimeSelectMap;

	public Map<Date, List<UserUnavailableDateTime>> userUnavailableDateTimeMap {get; set;}

	public Map<Date, String> dateDayOfWeek {get; set;}

	public Case dateCaseWorkAround {get; set;}

	public List<Event> myEventList {get; set;}

	public Id selectedAccountId {get; set;}

	public Boolean displayAcctSelector {get; set;}

	public String selectedAvailableTime {get; set;}

	public Case activeOutboundTouchpointCase {get; set;}

	public String scheduledCallFormat {get; set;}

	public String selectedTimeZone {get; set;}

	public Boolean optOutParam {get; set;}

	public Boolean optedOut {get; set;}

	private Id imsRepId;

	public WBNScheduleTouchpointController() {
		dateCaseWorkAround = new Case();
		selectedAvailableTime = '';
		optOutParam = false;
		Account acct;

		if(String.isNotBlank(ApexPages.currentPage().getParameters().get('salesforceAccountId'))){
			acct = [select Id, Name, IMS_Rep__c, IMS_Rep__r.Name, tz__Timezone_IANA__c, Next_TP_Needed_By__c from Account where Id = : ApexPages.currentPage().getParameters().get('salesforceAccountId') limit 1];
			selectedAccountId = acct.Id;
			selectedTimeZone = acct.tz__Timezone_IANA__c;
		}

		if(UserInfo.getUserType() != 'Guest'){
			displayAcctSelector = true;
		}else{
			displayAcctSelector = false;
		}

		if(String.isBlank(selectedTimeZone)){
			selectedTimeZone = UserInfo.getTimeZone().getID();
		}

		system.debug(UserInfo.getUserType());

		if(acct == null || Date.today().month() == acct.Next_TP_Needed_By__c.month()){
			dateCaseWorkAround.StartDate__c = Date.today();
		}else{
			dateCaseWorkAround.StartDate__c = Date.newInstance(Date.today().year(), Date.today().month() + 1, 1);
		}

		if(String.isNotBlank(ApexPages.currentPage().getParameters().get('optOutParam'))){
			optOutParam = ApexPages.currentPage().getParameters().get('optOutParam').equalsIgnoreCase('true') ? true : false;
		}
		optedOut = optOutParam;

		populateUserAvailability();
	}

	public List<SelectOption> getWBNAccounts() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('', 'Select an Account'));
        if(UserInfo.getUserType() != 'Guest' && String.isBlank(ApexPages.currentPage().getParameters().get('salesforceAccountId'))){
	        for(Account record : [select Id, Name, IMS_Rep__c from Account where Client_Type__c in ('YBN', 'National Account', 'National Master Account') and Marketo_ID__c != '' and Status__c = 'LIVE' order by Name]){
	        	options.add(new SelectOption(record.Id, record.Name));
	        }
	    }
        return options;
    }

    public List<SelectOption> getSupportedTimeZone() {
    	List<SelectOption> options = new List<SelectOption>();
    	options.add(new SelectOption('GMT','(GMT+00:00) Greenwich Mean Time (GMT)'));
		options.add(new SelectOption('Atlantic/Cape_Verde','(GMT-01:00) Cape Verde Time (Atlantic/Cape_Verde)'));
		options.add(new SelectOption('America/Sao_Paulo','(GMT-02:00) Brasilia Summer Time (America/Sao_Paulo)'));
		options.add(new SelectOption('Atlantic/South_Georgia','(GMT-02:00) South Georgia Time (Atlantic/South_Georgia)'));
		options.add(new SelectOption('America/Argentina/Buenos_Aires','(GMT-03:00) Argentina Time (America/Argentina/Buenos_Aires)'));
		options.add(new SelectOption('America/Santiago','(GMT-03:00) Chile Summer Time (America/Santiago)'));
		options.add(new SelectOption('America/St_Johns','(GMT-03:30) Newfoundland Standard Time (America/St_Johns)'));
		options.add(new SelectOption('America/Halifax','(GMT-04:00) Atlantic Standard Time (America/Halifax)'));
		options.add(new SelectOption('America/Puerto_Rico','(GMT-04:00) Atlantic Standard Time (America/Puerto_Rico)'));
		options.add(new SelectOption('Atlantic/Bermuda','(GMT-04:00) Atlantic Standard Time (Atlantic/Bermuda)'));
		options.add(new SelectOption('America/Caracas','(GMT-04:30) Venezuela Time (America/Caracas)'));
		options.add(new SelectOption('America/Bogota','(GMT-05:00) Colombia Time (America/Bogota)'));
		options.add(new SelectOption('America/Indiana/Indianapolis','(GMT-05:00) Eastern Standard Time (America/Indiana/Indianapolis)'));
		options.add(new SelectOption('America/Lima','(GMT-05:00) Peru Time (America/Lima)'));
		options.add(new SelectOption('America/New_York','(GMT-05:00) Eastern Standard Time (America/New_York)'));
		options.add(new SelectOption('America/Panama','(GMT-05:00) Eastern Standard Time (America/Panama)'));
		options.add(new SelectOption('America/Chicago','(GMT-06:00) Central Standard Time (America/Chicago)'));
		options.add(new SelectOption('America/El_Salvador','(GMT-06:00) Central Standard Time (America/El_Salvador)'));
		options.add(new SelectOption('America/Mexico_City','(GMT-06:00) Central Standard Time (America/Mexico_City)'));
		options.add(new SelectOption('America/Denver','(GMT-07:00) Mountain Standard Time (America/Denver)'));
		options.add(new SelectOption('America/Phoenix','(GMT-07:00) Mountain Standard Time (America/Phoenix)'));
		options.add(new SelectOption('America/Los_Angeles','(GMT-08:00) Pacific Standard Time (America/Los_Angeles)'));
		options.add(new SelectOption('America/Tijuana','(GMT-08:00) Pacific Standard Time (America/Tijuana)'));
		options.add(new SelectOption('America/Anchorage','(GMT-09:00) Alaska Standard Time (America/Anchorage)'));
		options.add(new SelectOption('Pacific/Honolulu','(GMT-10:00) Hawaii-Aleutian Standard Time (Pacific/Honolulu)'));

		return options;
    }

	public void populateUserAvailability(){
		dateTimeSelectMap = new Map<String, UserAvailableDateTime>();
		Set<String> weekendString = new Set<String>{'Saturday', 'Sunday'};
		userAvailableDateTimeMap = new Map<Date, List<UserAvailableDateTime>>();
		userUnavailableDateTimeMap = new Map<Date, List<UserUnavailableDateTime>>();
		activeOutboundTouchpointCase = new Case();
		dateDayOfWeek = new Map<Date, String>();

		if(String.isNotBlank(selectedAccountId)){
			
			try{
				activeOutboundTouchpointCase = [select Id, AccountId, Scheduled_Call__c, Account.Next_TP_Needed_By__c, Account.IMS_Rep__r.Name from Case where RecordType.Name = 'YBN Outbound Touch Point' and AccountId =: selectedAccountId and IsClosed = false order by CreatedDate DESC limit 1];
				imsRepId = [select IMS_Rep__c from Account where Id = : selectedAccountId and Id =: activeOutboundTouchpointCase.AccountId].IMS_Rep__c;

				if(activeOutboundTouchpointCase.Scheduled_Call__c != null){
					scheduledCallFormat = activeOutboundTouchpointCase.Scheduled_Call__c.format('MM/dd/yyyy hh:mm a', selectedTimeZone);
				}
			}catch(Exception E){
				ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'You do not have a touchpoint to schedule.');
            	ApexPages.addMessage(myMsg);
			}
		}else{
			imsRepId = UserInfo.getUserId();
		}

		Date selectedDate;
		if(activeOutboundTouchpointCase.Account.Next_TP_Needed_By__c == null || activeOutboundTouchpointCase.AccountId == null || Date.today().month() == activeOutboundTouchpointCase.Account.Next_TP_Needed_By__c.month()){
			selectedDate = Date.today();
		}else{
			selectedDate = Date.newInstance(activeOutboundTouchpointCase.Account.Next_TP_Needed_By__c.year(), activeOutboundTouchpointCase.Account.Next_TP_Needed_By__c.month(), 1);
		}

		Set<Date> currentHolidaySet = holidaySet(selectedDate);

		myEventList = [select Id, StartDateTime, DurationInMinutes from Event where OwnerId = :imsRepId and DAY_ONLY(StartDateTime) >= :selectedDate and DAY_ONLY(StartDateTime) <= :selectedDate.addDays(31) and ShowAs != 'Free'];

		for(Event record : myEventList){
			UserUnavailableDateTime unavailableDT = new UserUnavailableDateTime();
			unavailableDT.startTimeLong = record.StartDateTime.getTime();
			unavailableDT.endTimeLong = record.StartDateTime.addMinutes(record.DurationInMinutes).getTime();
			unavailableDT.startDateTime = record.StartDateTime;
			unavailableDT.endDateTime = record.StartDateTime.addMinutes(record.DurationInMinutes);

			if(!userUnavailableDateTimeMap.containsKey(record.StartDateTime.date())){
				List<UserUnavailableDateTime> unavailableList = new List<UserUnavailableDateTime>();
				unavailableList.add(unavailableDT);
				userUnavailableDateTimeMap.put(record.StartDateTime.date(), unavailableList);
			}else{
				userUnavailableDateTimeMap.get(record.StartDateTime.date()).add(unavailableDT);
			}

		}


		for(Integer i = 0; i < 31; i++){
			Date dateNow = selectedDate.addDays(i);
			DateTime dateTimeNow = DateTime.newInstance(dateNow, Time.newInstance(0, 0, 0, 0));

			if(dateNow.month() != selectedDate.month()){
				break;
			}

			//if(i > 1 && weekendString.contains(dateTimeNow.format('EEEE'))){
				//break;
			//}

			if(!weekendString.contains(dateTimeNow.format('EEEE'))){
				Time startTime;
				Time endTime;

				if(dateTimeNow.format('EEEE') == 'Monday'){
					startTime = ybnBusinessHours.MondayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
					endTime = ybnBusinessHours.MondayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
				}else if(dateTimeNow.format('EEEE') == 'Tuesday'){
					startTime = ybnBusinessHours.TuesdayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
					endTime = ybnBusinessHours.TuesdayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
				}else if(dateTimeNow.format('EEEE') == 'Wednesday'){
					startTime = ybnBusinessHours.WednesdayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
					endTime = ybnBusinessHours.WednesdayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
				}else if(dateTimeNow.format('EEEE') == 'Thursday'){
					startTime = ybnBusinessHours.ThursdayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
					endTime = ybnBusinessHours.ThursdayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
				}else if(dateTimeNow.format('EEEE') == 'Friday'){
					startTime = ybnBusinessHours.FridayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
					endTime = ybnBusinessHours.FridayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
				}/*else if(dateTimeNow.format('EEEE') == 'Saturday'){
					if(ybnBusinessHours.SaturdayStartTime != null){
						startTime = ybnBusinessHours.SaturdayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
						endTime = ybnBusinessHours.SaturdayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
					}else{
						startTime = ybnBusinessHours.FridayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
						endTime = ybnBusinessHours.FridayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
					}
				}else if(dateTimeNow.format('EEEE') == 'Sunday'){
					if(ybnBusinessHours.SaturdayStartTime != null){
						startTime = ybnBusinessHours.SundayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
						endTime = ybnBusinessHours.SundayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
					}else{
						startTime = ybnBusinessHours.FridayStartTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
						endTime = ybnBusinessHours.FridayEndTime.addMilliseconds(TimeZone.getTimeZone(UserInfo.getTimeZone().getID()).getOffset(DateTime.now()) - TimeZone.getTimeZone(ybnBusinessHours.TimeZoneSidKey).getOffset(DateTime.now()));
					}
				}*/

				userAvailableDateTimeMap.put(dateNow, new List<UserAvailableDateTime>());
				dateDayOfWeek.put(dateNow, dateTimeNow.format('EEEE'));

				while(startTime < endTime){
					UserAvailableDateTime uaDT = new UserAvailableDateTime();
					uaDT.startDateTime = DateTime.newInstance(dateNow, startTime);
					uaDT.endDateTime = DateTime.newInstance(dateNow, startTime.addMinutes(30));
					uaDT.startTime = startTime;
					uaDT.endTime = startTime.addMinutes(30);
					uaDT.timeZoneSet = selectedTimeZone;
					//uaDT.timeZoneDisplayName = Timezone.getTimeZone(uaDT.timeZoneSet).getDisplayName();
					uaDT.convertedStartDateTime = uaDT.startDateTime.format('hh:mm a', uaDT.timeZoneSet);
					uaDT.convertedEndDateTime = uaDT.endDateTime.format('hh:mm a', uaDT.timeZoneSet);
					uaDT.dateNowFormat = dateNow.format();
					uaDT.repAvailable = true;
					uaDT.temporaryId = uaDT.startDateTime.format();

					if(!BusinessHours.isWithin(ybnBusinessHours.Id, uaDT.startDateTime)){
						uaDT.repAvailable = false;
					}

					if(dateNow <= Date.today()){
						uaDT.repAvailable = false;
					}else if(userUnavailableDateTimeMap.containsKey(dateNow)){
						for(UserUnavailableDateTime unavailableDT : userUnavailableDateTimeMap.get(dateNow)){
							if(unavailableDT.startDateTime == uaDT.startDateTime && unavailableDT.endDateTime == uaDT.endDateTime){
								uaDT.repAvailable = false;
							}else if(unavailableDT.startDateTime < uaDT.endDateTime && unavailableDT.endDateTime > uaDT.endDateTime){
								uaDT.repAvailable = false;
							}else if(unavailableDT.startDateTime < uaDT.startDateTime && unavailableDT.endDateTime > uaDT.startDateTime){
								uaDT.repAvailable = false;
							}
						}
					}

					dateTimeSelectMap.put(uaDT.temporaryId, uaDT);
					userAvailableDateTimeMap.get(dateNow).add(uaDT);

					startTime = startTime.addMinutes(30);
				}
			}
		}

	}

	public Set<Date> holidaySet(Date selectedWeekStartDate){
		Set<Date> currentHolidaySet = new Set<Date>();
		for(Holiday record : [select ActivityDate from Holiday where ActivityDate >= : selectedWeekStartDate and ActivityDate <= : selectedWeekStartDate.addDays(7)]){
			//currentHolidaySet.add(record.ActivityDate);
		}

		return currentHolidaySet;
	}

	public void scheduleTime(){
		system.debug(dateTimeSelectMap.get(selectedAvailableTime));
		//Event newEvent = new Event();
		//newEvent.OwnerId = imsRepId;
		//newEvent.StartDateTime = dateTimeSelectMap.get(selectedAvailableTime).startDateTime;
		//newEvent.DurationInMinutes = 30;
		//newEvent.WhatId = selectedAccountId;
		//insert newEvent;

		activeOutboundTouchpointCase.Scheduled_Call__c = dateTimeSelectMap.get(selectedAvailableTime).startDateTime;
		activeOutboundTouchpointCase.Resolution_Attempt_Status_1__c = 'Call Scheduled';
		activeOutboundTouchpointCase.Status = 'Call Scheduled';
		update activeOutboundTouchpointCase;

		populateUserAvailability();
	}

	public void optOutOfCurrentTouchpoint(){

		try{
			activeOutboundTouchpointCase.Resolution_Attempt_Status_1__c = 'Opted Out';
			activeOutboundTouchpointCase.Status = Label.ClosedOptOutWBNStatus;
			update activeOutboundTouchpointCase;
		}catch(Exception E){
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'You do not have a touchpoint to opt out.');
        	ApexPages.addMessage(myMsg);
		}

		optedOut = true;
		optOutParam = false;

		//populateUserAvailability();
	}

	public void unOptOutOfCurrentTouchpoint(){
		try{
			activeOutboundTouchpointCase.Resolution_Attempt_Status_1__c = '';
			activeOutboundTouchpointCase.Status = Label.UnOptOutWBNStatus;
			update activeOutboundTouchpointCase;
			optedOut = false;
		}catch(Exception E){
			ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'System can\'t find a scheduled touchpoint. Please contact your Sales Rep.');
        	ApexPages.addMessage(myMsg);
		}
	}

	public class UserUnavailableDateTime {
		public Long startTimeLong {get; set;}
		public Long endTimeLong {get; set;}
		public DateTime startDateTime {get; set;}
		public DateTime endDateTime {get; set;}
	}

	public class UserAvailableDateTime {
		public String temporaryId {get; set;}
		public String dateNowFormat {get; set;}
		public Time startTime {get; set;}
		public Time endTime {get; set;}
		public DateTime startDateTime {get; set;}
		public DateTime endDateTime {get; set;}
		public String timeZoneSet {get; set;}
		public String timeZoneDisplayName {get; set;}
		public String convertedStartDateTime {get; set;}
		public String convertedEndDateTime {get; set;}
		public Boolean repAvailable {get; set;}
	}

}