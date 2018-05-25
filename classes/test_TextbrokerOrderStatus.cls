@isTest
public with sharing class test_TextbrokerOrderStatus {

    @isTest
    public static void testTextbrokerOrderStatus() {

        TextbrokerOrderStatus tos = new TextbrokerOrderStatus();
        List<TextbrokerOrderStatus.Message> messages = new List<TextbrokerOrderStatus.Message>();

        TextbrokerOrderStatus.Message msg1 = new TextbrokerOrderStatus.Message();
        msg1.code=100;
        msg1.severity='BAD';
        msg1.message='This is bad.';

        TextbrokerOrderStatus.Message msg2 = new TextbrokerOrderStatus.Message();
        msg2.code=200;
        msg2.severity='REAL BAD';
        msg2.message='This is real bad.';

        messages.add(msg1);
        messages.add(msg2);
        tos.messages = messages;

        String expectedResult = '100 (BAD): This is bad.;200 (REAL BAD): This is real bad.;';

        System.assertEquals(expectedResult, tos.getMessagesAsString());

    }

    @isTest
    public static void testFromXml() {
        Dom.Document doc = new Dom.Document();
        doc.load('' +
        '<?xml version="1.0" encoding="UTF-8"?>' +
        '<tbmo:createOrdersResponse xmlns:tbmo="urn:textbroker:managedorder:201305" xmlns="urn:textbroker:core:201305">' +
        '   <orderStatusUpdate>' +
        '       <orderStatus id="178209d0-c9e8-11e2-8b8b-0800200c9a66" occurred="2006-05-04T18:13:51.0Z">' +
        '       <status code="revisionRequest">revisionRequest status</status>' +
        '          <referenceID>case 1</referenceID>' +
        '          <messages>' +
        '              <message code="501" severity="error">501 error</message>' +
        '          </messages>' +
        '       </orderStatus>' +
        '   </orderStatusUpdate>' +
        '</tbmo:createOrdersResponse>');

        Dom.XmlNode root = doc.getRootElement();
        Dom.XmlNode orderStatusUpdate = root.getChildElement('orderStatusUpdate', TextbrokerHelper.ns);
        List<Dom.Xmlnode> orderStatusChildren = orderStatusUpdate.getChildElements();

        TextbrokerOrderStatus tos = new TextbrokerOrderStatus();
        tos.fromXml(orderStatusChildren[0]);

        System.assertEquals(1, tos.messages.size());
    }

}