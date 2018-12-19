public class CTSTicketResponse {

    public class Response {
        public String providerApplicationName {get;set;} 
        public String clientRequestId {get;set;} 
        public String status {get;set;} 
        public String errors {get;set;} 
        public Data data {get;set;} 
        public String messageId {get;set;} 

        public Response(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'providerApplicationName') {
                            providerApplicationName = parser.getText();
                        } else if (text == 'clientRequestId') {
                            clientRequestId = parser.getText();
                        } else if (text == 'status') {
                            status = parser.getText();
                        } else if (text == 'errors') {
                            errors = parser.getText();
                        } else if (text == 'data') {
                            data = new Data(parser);
                        } else if (text == 'messageId') {
                            messageId = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Response consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    public List<Response> response {get;set;} 

    public CTSTicketResponse(JSONParser parser) {
        while (parser.nextToken() != System.JSONToken.END_OBJECT) {
            if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                String text = parser.getText();
                if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                    if (text == 'response') {
                        response = arrayOfResponse(parser);
                    } else {
                        System.debug(LoggingLevel.WARN, 'CTSTicketResponse consuming unrecognized property: '+text);
                        consumeObject(parser);
                    }
                }
            }
        }
    }
    
    public class Data {
        public String ticketNumber {get;set;} 

        public Data(JSONParser parser) {
            while (parser.nextToken() != System.JSONToken.END_OBJECT) {
                if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    String text = parser.getText();
                    if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
                        if (text == 'ticketNumber') {
                            ticketNumber = parser.getText();
                        } else {
                            System.debug(LoggingLevel.WARN, 'Data consuming unrecognized property: '+text);
                            consumeObject(parser);
                        }
                    }
                }
            }
        }
    }
    
    
    public static CTSTicketResponse parse(String json) {
        System.JSONParser parser = System.JSON.createParser(json);
        return new CTSTicketResponse(parser);
    }
    
    public static void consumeObject(System.JSONParser parser) {
        Integer depth = 0;
        do {
            System.JSONToken curr = parser.getCurrentToken();
            if (curr == System.JSONToken.START_OBJECT || 
                curr == System.JSONToken.START_ARRAY) {
                depth++;
            } else if (curr == System.JSONToken.END_OBJECT ||
                curr == System.JSONToken.END_ARRAY) {
                depth--;
            }
        } while (depth > 0 && parser.nextToken() != null);
    }
    
    private static List<Response> arrayOfResponse(System.JSONParser p) {
        List<Response> res = new List<Response>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Response(p));
        }
        return res;
    }
}