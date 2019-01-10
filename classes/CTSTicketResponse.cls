/*public class CTSTicketResponse {

    public class Response {
        public String providerApplicationName {get; set;}
        public String clientRequestId {get; set;}
        public String status {get; set;}
        public Object errors {get; set;}
        public Data data {get; set;}
        public String messageId {get; set;}
    }

    public class Errors {
        public String source {get; set;}
        public String statusCode {get; set;}
        public String message {get; set;}
        public String errorId {get; set;}
    }

    public class Data {
        public String ticketNumber {get; set;}
    }

    public List<Response> response;

    
    public static CTSTicketResponse parse(String json) {
        return (CTSTicketResponse) System.JSON.deserialize(json, CTSTicketResponse.class);
    }
}*/


    public class CTSTicketResponse {
        public String providerApplicationName {get; set;}
        public String clientRequestId {get; set;}
        public String status {get; set;}
        public List<Errors> errors {get; set;}
        public Data data {get; set;}
        public String messageId {get; set;}
    

    public class Errors {
        public String source {get; set;}
        public String statusCode {get; set;}
        public String message {get; set;}
        public String errorId {get; set;}
    }
    
    //public class Errors {
    //    public List<Error> errors { get; set; }
    //}
    
    
    public class ResponseDetail {
        public String ticketNumber {get; set;}
    }
    
    

    public class Data {
        public String crmId {get; set;}
        public List<ResponseDetail> details {get; set;}
        
    }
              
    public static CTSTicketResponse parse(String json) {
        return (CTSTicketResponse) System.JSON.deserialize(json, CTSTicketResponse.class);
    }

}