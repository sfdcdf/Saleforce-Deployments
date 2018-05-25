@isTest
public with sharing class TextbrokerXmlPrinter {
	
	public static String prettyPrint(dom.Xmlnode node, Integer padding) {
		String resp = '';
		
		//Print node's children		
		List<dom.Xmlnode> children = node.getChildElements();
		if(children.size() > 0) {
			for(dom.Xmlnode child : children) {
				padding++;		
				resp =  resp + printNodeOpeningTag(child, padding);
				resp = resp + printNodeText(child);		
				//Recursively call this same function to print children
				resp = resp + prettyPrint(child, padding);
				resp =  resp + printNodeClosingTag(child, padding);		
				padding--;
			}
		}
		return resp;
	}
	
	public static String printNodeOpeningTag(dom.Xmlnode node, Integer padding) {
		String ns = node.getNamespace();
		String prefix = null;
		if(ns != null) prefix = node.getPrefixFor(ns);
		String nodeOpeningTag = printPadding(padding) + '<' + (prefix == null ? '' : prefix + ':') + node.getName();
		for(Integer i = 0; i < node.getAttributeCount(); i++) {
			String key = node.getAttributeKeyAt(i);
			String keyNamespace = node.getAttributeKeyNsAt(i);
			String valueNamespace = node.getAttributeValueNs(key, keyNamespace);	
			String value = node.getAttributeValue(key, keyNamespace);
			nodeOpeningTag = nodeOpeningTag + ' ' + (keyNamespace == null ? '' : keyNamespace + ':') + key + '="' 
									+ (valueNamespace == null ? '' : valueNamespace + ':') + value + '" ';
		}
		nodeOpeningTag = nodeOpeningTag + '>';
		System.debug(LoggingLevel.WARN, '****Opening Tag: ' + nodeOpeningTag);
		return nodeOpeningTag;
	}
	
	public static String printNodeText(dom.Xmlnode node) {
		String resp = '';
		//Print node text, if any
		if(node != null && node.getText() != null && node.getText() != '') {
			 resp = resp + node.getText();
			 System.debug(LoggingLevel.WARN, '****Node Text: ' + node.getText());
		} else {
			resp = resp + '\n';
			System.debug(LoggingLevel.WARN, '****New line');
		}
		return resp;
	}
	
	public static String printNodeClosingTag(dom.Xmlnode node, Integer padding) {
		String nodeClosingTag = '';
		if(node != null && node.getText() != null && node.getText() != '') {
			nodeClosingTag = '</' + node.getName() + '>' + '\n';
		} else {					
			nodeClosingTag = printPadding(padding) + '</' + node.getName() + '>' + '\n';
		}
		System.debug(LoggingLevel.WARN, '****Node Closing Tag: ' + nodeClosingTag);
		return nodeClosingTag; 
	}
	
	private static String printPadding(Integer counter) {
		String padding = '';
		for(Integer i = 0; i < counter; i++) {
			padding = padding + '\t';
		}
		return padding;
	}
}