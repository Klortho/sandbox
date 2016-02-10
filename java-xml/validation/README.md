# Java XML validation examples

This uses Java's built-in XSD validator, and the RNG validator from jing-trang.

The code started out as the example code on the
[javax.xml.validation package 
summary](https://docs.oracle.com/javase/7/docs/api/javax/xml/validation/package-summary.html)
page.

The two types of validation, and the URLs used to specify them, are given in the
[SchemaFactory](https://docs.oracle.com/javase/7/docs/api/javax/xml/validation/SchemaFactory.html).
But, only XSD is covered out-of-the-box.

To get jing-trang to work, clone https://github.com/relaxng/jing-trang.git,
and then build it with `./ant`.

Then, back in this directory, do the following (note that you don't have to 
set CLASSPATH to point to jing.jar to build, but you will need it to run).

```
javac MultiValidatorFactory.java
java -cp .:jing-trang/build/jing.jar MultiValidatorFactory
```
