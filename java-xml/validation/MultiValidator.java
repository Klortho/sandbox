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
public class MultiValidator {
    public SchemaFactory xsdFactory;
    public SchemaFactory rngFactory;

    public static void main(String[] args) throws Exception {
        // Specify the Java class for relaxng
        System.setProperty(
            SchemaFactory.class.getName() + ":" + XMLConstants.RELAXNG_NS_URI, 
            "com.thaiopensource.relaxng.jaxp.XMLSyntaxSchemaFactory");

        MultiValidator v = new MultiValidator();

        System.out.println("Validating a good document:");
        v.xsdValidate("good.xml");
        v.rngValidate("good.xml");

        System.out.println("\nAnd now a bad one:");
        v.xsdValidate("bad.xml");
        v.rngValidate("bad.xml");
    }

    public MultiValidator() {
        // Create the schema-language-specific SchemaFactories
        xsdFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
        rngFactory = SchemaFactory.newInstance(XMLConstants.RELAXNG_NS_URI);
    }

    public void xsdValidate(String xml) 
      throws Exception
    {
        // Load an XSD schema
        Schema schema = xsdFactory.newSchema(
            new StreamSource(new File("schema.xsd")));

        // create a Validator instance
        Validator validator = schema.newValidator();

        // validate the DOM tree
        boolean valid = true;
        try {
            validator.validate(new StreamSource(new File(xml)));
        } 
        catch (SAXException e) {
            System.out.println("According to the XSD, this is invalid: " +
                e.getMessage());
            valid = false;
        }
        if (valid) {
            System.out.println("According to the XSD, this is valid!");
        }
    }

    public void rngValidate(String xml) 
      throws Exception
    {
        // load a WXS schema, represented by a Schema instance
        Schema schema = rngFactory.newSchema(
            new StreamSource(new File("schema.rng")));

        // create a Validator instance
        Validator validator = schema.newValidator();

        // validate the DOM tree
        boolean valid = true;
        try {
            // Jing's validate method doesn't accept a DOMSource
            validator.validate(new StreamSource(new File(xml)));
        } 
        catch (SAXException e) {
            System.out.println("According to the RNG, this is invalid: " +
                e.getMessage());
            valid = false;
        }
        if (valid) {
            System.out.println("According to the RNG, this is valid!");
        }
    }
}
