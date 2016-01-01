package org.chrismaloney.sandbox;

import static org.hamcrest.text.MatchesPattern.matchesPattern;
import static org.junit.Assert.assertThat;

import org.junit.Rule;
import org.junit.rules.TestName;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HelloTest {
    private Logger log;

    @Rule
    public TestName name = new TestName();

    @Test
    public void testHello()
    {
        Logger log = LoggerFactory.getLogger(name.getClass());
        log.info("Starting test " + name.getMethodName());

        assertThat("foo", matchesPattern("fo+"));

        // Instantiate a Hello object
        Hello app = new Hello();
    }
}