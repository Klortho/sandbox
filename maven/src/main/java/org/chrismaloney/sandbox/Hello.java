package org.chrismaloney.sandbox;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Hello world app.
 */
public class Hello 
{
    private Logger log;

    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
    }

    public Hello() {
        Logger log = LoggerFactory.getLogger(Hello.class);
        log.info("Log message from the Hello app!");
    }
}
