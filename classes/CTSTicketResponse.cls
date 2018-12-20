public class CTSTicketResponse {

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
}