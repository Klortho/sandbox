# XML Validator

Here's an embryonic XML validation tool using libxmljs.

In this incarnation, I'm using libxmljs-mt, which is a fork that provides
an asynchronous method.

The file test.js contains both the validator itself and the test harness.
It uses a lot of test XML files in this directory.



## Problems / to-do

### XInclude is not working

The Tag Library sources use XInclude, and it would
be nice to be able to validate with that, but not essential.

I think there is a bug in the library we're using,
[libxmljs-mt](https://www.npmjs.com/package/libxmljs-mt). I even tried
to fix it, [here](https://github.com/Klortho/libxmljs/commit/f0164f89cfefb17963cc739e6b20b9ae91d9418d),
but it did not work. See also the file try-xinclude.js.

Note that the XInclude problem has nothing to do with validation: the
\<xi:include> elements are just not getting expanded. But, assuming we
were able to get that working, there might be another problem. In order
to validate files that use xinclude, in xmllint, for example, you have
to give it the `--postvalid` argument, to ensure that validation happens
after all the expansions. I don't see that option in libxmljs-mt.
