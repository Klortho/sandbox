import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import javax.xml.XMLConstants;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

// parse an XML document into a DOM tree
public class TryValidator {
    public static void main(String[] args) throws Exception {

        DocumentBuilder parser = DocumentBuilderFactory.newInstance().newDocumentBuilder();
        Document document = parser.parse(new File("instance.xml"));

        xsdValidate(document);

    }

    public static void xsdValidate(Document document) 
      throws Exception
    {
        // create a SchemaFactory capable of understanding WXS schemas
        SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);

        // load a WXS schema, represented by a Schema instance
        Source schemaFile = new StreamSource(new File("schema.xsd"));
        Schema schema = factory.newSchema(schemaFile);

        // create a Validator instance, which can be used to validate an instance document
        Validator validator = schema.newValidator();

        // validate the DOM tree
        boolean valid = true;
        try {
            validator.validate(new DOMSource(document));
        } 
        catch (SAXException e) {
            System.out.println("According to the XSD, this is invalid!");
            valid = false;
        }
        if (valid) {
            System.out.println("According to the XSD, this is valid!");
        }

    }
}
