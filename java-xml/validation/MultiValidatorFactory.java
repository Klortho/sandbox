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

/**
 * This class can generate schema validators in many languages.
 */
public class MultiValidatorFactory {
    public SchemaFactory xsdFactory;
    public SchemaFactory rngFactory;
    // FIXME: add relax-ng compact.

    public static void main(String[] args) throws Exception {
        // Specify the Java class for relaxng
        System.setProperty(
            SchemaFactory.class.getName() + ":" + XMLConstants.RELAXNG_NS_URI, 
            "com.thaiopensource.relaxng.jaxp.XMLSyntaxSchemaFactory");

        MultiValidatorFactory v = new MultiValidatorFactory();

        System.out.println("XSD");
        Validator xsdValidator = v.newValidator("schema.xsd");
        System.out.println("Good document:");
        validate(xsdValidator, "good.xml");
        System.out.println("Bad one:");
        validate(xsdValidator, "bad.xml");

        System.out.println("RNG");
        Validator rngValidator = v.newValidator("schema.rng");
        System.out.println("Good document:");
        validate(rngValidator, "good.xml");
        System.out.println("Bad one:");
        validate(rngValidator, "bad.xml");
    }

    public MultiValidatorFactory() {
        // Create the schema-language-specific SchemaFactories
        xsdFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
        rngFactory = SchemaFactory.newInstance(XMLConstants.RELAXNG_NS_URI);
    }

    /**
     * Generate a new Validator from a file. The type of validator
     * is determined by the file's extension.
     */
    private Validator newValidator(String filename) 
        throws SAXException
    {
        SchemaFactory schemaFactory = 
            filename.endsWith(".xsd") ? xsdFactory :
            filename.endsWith(".rng") ? rngFactory : null;
        if (schemaFactory == null) 
            throw new IllegalArgumentException("Schema filename must end with " +
                ".xsd or .rng");

        Schema schema = schemaFactory.newSchema(
            new StreamSource(new File(filename)));
        return schema.newValidator();
    }

    public static void validate(Validator validator, String filename) 
      throws Exception
    {
        boolean valid = true;
        try {
            validator.validate(new StreamSource(new File(filename)));
        } 
        catch (SAXException e) {
            System.out.println("Invalid: " + e.getMessage());
            valid = false;
        }
        if (valid) {
            System.out.println("Valid!");
        }
    }
}

