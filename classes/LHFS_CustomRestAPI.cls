@RestResource(urlMapping='/cancelledClients/*')
global class LHFS_CustomRestAPI {

	@HttpGet
	global static void cancelledClients(){
		RestRequest req = RestContext.request;
		system.debug(req.remoteAddress);
		system.debug(req.headers.get('yotoken'));
		String yotoken = req.headers.get('yotoken');

		try{
			String expectedYotoken = EncodingUtil.base64Decode(yotoken).toString();

			if(expectedYotoken != 'yodata2016'){
				RestContext.response.addHeader('Content-Type', 'application/json');
	        	RestContext.response.responseBody = Blob.valueOf(JSON.serialize('You don\'t belong here!'));
				return;
			}
		}catch (Exception E){
				RestContext.response.addHeader('Content-Type', 'application/json');
	        	RestContext.response.responseBody = Blob.valueOf(JSON.serialize('You don\'t belong here!'));
				return;
		}


		List<CancelledWrapper> cancelledWrapperList = new List<CancelledWrapper>();
		for(Case record : [select Client_ID__c, CreatedDate from Case where RecordType.Name = 'LH Cancel Request' and Type = 'Field Service' and Status = 'Churned']){
			CancelledWrapper newCW = new CancelledWrapper();
			newCW.clientId = record.Client_ID__c;
			newCW.createdDate = record.CreatedDate;
			cancelledWrapperList.add(newCW);
		}


		RestContext.response.addHeader('Content-Type', 'application/json');
        RestContext.response.responseBody = Blob.valueOf(JSON.serialize(cancelledWrapperList));
	}

	private class CancelledWrapper{
		private String clientId;
		private DateTime createdDate;
	}

}