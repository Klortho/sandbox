Here are a set of examples for use with 
[eXist-db](http://exist-db.org/exist/apps/homepage/index.html), an open-source
XML database.

To install these:

* Clone the repository under the `webapp` directory of an
  eXist-db installation,

* In the *startup.sh* script for the database, set a few system properites, to define
  external dependencies, like this: 

    ```
    MY_OPTS="-Dcfm.example.self-base-url=http://my-domain:port"
    MY_OPTS="$MY_OPTS -Dcfm.example.data-dir=/absolute/path/to/webapp"
    MY_OPTS="$MY_OPTS -Dcfm.example.field-info-cgi=http://.../FieldInfoToXml.cgi"
    MY_OPTS="$MY_OPTS -Dcfm.example.servers-databases-xml=.../ServersDatabases.xml"
    ```

* Then, also in *startup.sh*, add `${CFM_OPTS}` into the `java` command line that
  invokes the server.
  
  