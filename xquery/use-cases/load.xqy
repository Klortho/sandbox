xquery version "1.0-ml";

(:
 : See http://www.w3.org/TR/xquery-use-cases
 :)

(: =========================================================== :)
(: Data for XMP: Experiences and Exemplars :)

xdmp:document-insert("http://bstore1.example.com/bib.xml",
<bib>
    <book year="1994">
        <title>TCP/IP Illustrated</title>
        <author><last>Stevens</last><first>W.</first></author>
        <publisher>Addison-Wesley</publisher>
        <price>65.95</price>
    </book>
 
    <book year="1992">
        <title>Advanced Programming in the Unix environment</title>
        <author><last>Stevens</last><first>W.</first></author>
        <publisher>Addison-Wesley</publisher>
        <price>65.95</price>
    </book>
 
    <book year="2000">
        <title>Data on the Web</title>
        <author><last>Abiteboul</last><first>Serge</first></author>
        <author><last>Buneman</last><first>Peter</first></author>
        <author><last>Suciu</last><first>Dan</first></author>
        <publisher>Morgan Kaufmann Publishers</publisher>
        <price>39.95</price>
    </book>
 
    <book year="1999">
        <title>The Economics of Technology and Content for Digital TV</title>
        <editor>
               <last>Gerbarg</last><first>Darcy</first>
                <affiliation>CITI</affiliation>
        </editor>
            <publisher>Kluwer Academic Publishers</publisher>
        <price>129.95</price>
    </book>
 
</bib>);


xdmp:document-insert("http://bstore2.example.com/reviews.xml",
<reviews>
    <entry>
        <title>Data on the Web</title>
        <price>34.95</price>
        <review>
               A very good discussion of semi-structured database
               systems and XML.
        </review>
    </entry>
    <entry>
        <title>Advanced Programming in the Unix environment</title>
        <price>65.95</price>
        <review>
               A clear and detailed discussion of UNIX programming.
        </review>
    </entry>
    <entry>
        <title>TCP/IP Illustrated</title>
        <price>65.95</price>
        <review>
               One of the best books on TCP/IP.
        </review>
    </entry>
</reviews>);

xdmp:document-insert("books.xml",
<chapter>
    <title>Data Model</title>
    <section>
        <title>Syntax For Data Model</title>
    </section>
    <section>
        <title>XML</title>
        <section>
            <title>Basic Syntax</title>
        </section>
        <section>
            <title>XML and Semistructured Data</title>
        </section>
    </section>
</chapter>);

xdmp:document-insert("prices.xml",
<prices>
    <book>
        <title>Advanced Programming in the Unix environment</title>
        <source>bstore2.example.com</source>
        <price>65.95</price>
    </book>
    <book>
        <title>Advanced Programming in the Unix environment</title>
        <source>bstore1.example.com</source>
        <price>65.95</price>
    </book>
    <book>
        <title>TCP/IP Illustrated</title>
        <source>bstore2.example.com</source>
        <price>65.95</price>
    </book>
    <book>
        <title>TCP/IP Illustrated</title>
        <source>bstore1.example.com</source>
        <price>65.95</price>
    </book>
    <book>
        <title>Data on the Web</title>
        <source>bstore2.example.com</source>
        <price>34.95</price>
    </book>
    <book>
        <title>Data on the Web</title>
        <source>bstore1.example.com</source>
        <price>39.95</price>
    </book>
</prices>);


(: =========================================================== :)
(: Data for TREE: Queries that preserve hierarchy :)

xdmp:document-insert("book.xml",
<book>
  <title>Data on the Web</title>
  <author>Serge Abiteboul</author>
  <author>Peter Buneman</author>
  <author>Dan Suciu</author>
  <section id="intro" difficulty="easy" >
    <title>Introduction</title>
    <p>Text ... </p>
    <section>
      <title>Audience</title>
      <p>Text ... </p>
    </section>
    <section>
      <title>Web Data and the Two Cultures</title>
      <p>Text ... </p>
      <figure height="400" width="400">
        <title>Traditional client/server architecture</title>
        <image source="csarch.gif"/>
      </figure>
      <p>Text ... </p>
    </section>
  </section>
  <section id="syntax" difficulty="medium" >
    <title>A Syntax For Data</title>
    <p>Text ... </p>
    <figure height="200" width="500">
      <title>Graph representations of structures</title>
      <image source="graphs.gif"/>
    </figure>
    <p>Text ... </p>
    <section>
      <title>Base Types</title>
      <p>Text ... </p>
    </section>
    <section>
      <title>Representing Relational Databases</title>
      <p>Text ... </p>
      <figure height="250" width="400">
        <title>Examples of Relations</title>
        <image source="relations.gif"/>
      </figure>
    </section>
    <section>
      <title>Representing Object Databases</title>
      <p>Text ... </p>
    </section>       
  </section>
</book>);


(: =========================================================== :)
(: Data for SEQ: Queries based on Sequence :)

xdmp:document-insert("report1.xml",
<report>
  <section>
    <section.title>Procedure</section.title>
     <section.content>
      The patient was taken to the operating room where she was placed
      in supine position and
      <anesthesia>induced under general anesthesia.</anesthesia>
      <prep> 
        <action>A Foley catheter was placed to decompress the bladder</action>
        and the abdomen was then prepped and draped in sterile fashion.
      </prep>  
      <incision>
        A curvilinear incision was made
        <geography>in the midline immediately infraumbilical</geography>
        and the subcutaneous tissue was divided
        <instrument>using electrocautery.</instrument>
      </incision>
      The fascia was identified and
      <action>#2 0 Maxon stay sutures were placed on each side of the midline.
      </action>
      <incision>
        The fascia was divided using
        <instrument>electrocautery</instrument>
        and the peritoneum was entered.
      </incision>
      <observation>The small bowel was identified.</observation>
      and
      <action>
        the
        <instrument>Hasson trocar</instrument>
        was placed under direct visualization.
      </action>
      <action>
        The
        <instrument>trocar</instrument>
        was secured to the fascia using the stay sutures.
      </action>
     </section.content>
  </section>
</report>);


(: =========================================================== :)
(: Data for R: Access to Relational Data :)

xdmp:document-insert("items.xml",
<items>
  <item_tuple>
    <itemno>1001</itemno>
    <description>Red Bicycle</description>
    <offered_by>U01</offered_by>
    <start_date>1999-01-05</start_date>
    <end_date>1999-01-20</end_date>
    <reserve_price>40</reserve_price>
  </item_tuple>
  <item_tuple>
    <itemno>1002</itemno>
    <description>Motorcycle</description>
    <offered_by>U02</offered_by>
    <start_date>1999-02-11</start_date>
    <end_date>1999-03-15</end_date>
    <reserve_price>500</reserve_price>
  </item_tuple>
  <item_tuple>
    <itemno>1003</itemno>
    <description>Old Bicycle</description>
    <offered_by>U02</offered_by>
    <start_date>1999-01-10</start_date>
    <end_date>1999-02-20</end_date>
    <reserve_price>25</reserve_price>
  </item_tuple>
  <item_tuple>
    <itemno>1004</itemno>
    <description>Tricycle</description>
    <offered_by>U01</offered_by>
    <start_date>1999-02-25</start_date>
    <end_date>1999-03-08</end_date>
    <reserve_price>15</reserve_price>
  </item_tuple>
  <item_tuple>
    <itemno>1005</itemno>
    <description>Tennis Racket</description>
    <offered_by>U03</offered_by>
    <start_date>1999-03-19</start_date>
    <end_date>1999-04-30</end_date>
    <reserve_price>20</reserve_price>
  </item_tuple>
  <item_tuple>
    <itemno>1006</itemno>
    <description>Helicopter</description>
    <offered_by>U03</offered_by>
    <start_date>1999-05-05</start_date>
    <end_date>1999-05-25</end_date>
    <reserve_price>50000</reserve_price>
  </item_tuple>
  <item_tuple>
    <itemno>1007</itemno>
    <description>Racing Bicycle</description>
    <offered_by>U04</offered_by>
    <start_date>1999-01-20</start_date>
    <end_date>1999-02-20</end_date>
    <reserve_price>200</reserve_price>
  </item_tuple>
  <item_tuple>
    <itemno>1008</itemno>
    <description>Broken Bicycle</description>
    <offered_by>U01</offered_by>
    <start_date>1999-02-05</start_date>
    <end_date>1999-03-06</end_date>
    <reserve_price>25</reserve_price>
  </item_tuple>
</items>);

xdmp:document-insert("users.xml",
<users>
  <user_tuple>
    <userid>U01</userid>
    <name>Tom Jones</name>
    <rating>B</rating>
  </user_tuple>
  <user_tuple>
    <userid>U02</userid>
    <name>Mary Doe</name>
    <rating>A</rating>
  </user_tuple>
  <user_tuple>
    <userid>U03</userid>
    <name>Dee Linquent</name>
    <rating>D</rating>
  </user_tuple>
  <user_tuple>
    <userid>U04</userid>
    <name>Roger Smith</name>
    <rating>C</rating>
  </user_tuple>
  <user_tuple>
    <userid>U05</userid>
    <name>Jack Sprat</name>
    <rating>B</rating>
  </user_tuple>
  <user_tuple>
    <userid>U06</userid>
    <name>Rip Van Winkle</name>
    <rating>B</rating>
  </user_tuple>
</users>);

xdmp:document-insert("bids.xml",
<bids>
  <bid_tuple>
    <userid>U02</userid>
    <itemno>1001</itemno>
    <bid>35</bid>
    <bid_date>1999-01-07</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U04</userid>
    <itemno>1001</itemno>
    <bid>40</bid>
    <bid_date>1999-01-08</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U02</userid>
    <itemno>1001</itemno>
    <bid>45</bid>
    <bid_date>1999-01-11</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U04</userid>
    <itemno>1001</itemno>
    <bid>50</bid>
    <bid_date>1999-01-13</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U02</userid>
    <itemno>1001</itemno>
    <bid>55</bid>
    <bid_date>1999-01-15</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U01</userid>
    <itemno>1002</itemno>
    <bid>400</bid>
    <bid_date>1999-02-14</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U02</userid>
    <itemno>1002</itemno>
    <bid>600</bid>
    <bid_date>1999-02-16</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U03</userid>
    <itemno>1002</itemno>
    <bid>800</bid>
    <bid_date>1999-02-17</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U04</userid>
    <itemno>1002</itemno>
    <bid>1000</bid>
    <bid_date>1999-02-25</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U02</userid>
    <itemno>1002</itemno>
    <bid>1200</bid>
    <bid_date>1999-03-02</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U04</userid>
    <itemno>1003</itemno>
    <bid>15</bid>
    <bid_date>1999-01-22</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U05</userid>
    <itemno>1003</itemno>
    <bid>20</bid>
    <bid_date>1999-02-03</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U01</userid>
    <itemno>1004</itemno>
    <bid>40</bid>
    <bid_date>1999-03-05</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U03</userid>
    <itemno>1007</itemno>
    <bid>175</bid>
    <bid_date>1999-01-25</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U05</userid>
    <itemno>1007</itemno>
    <bid>200</bid>
    <bid_date>1999-02-08</bid_date>
  </bid_tuple>
  <bid_tuple>
    <userid>U04</userid>
    <itemno>1007</itemno>
    <bid>225</bid>
    <bid_date>1999-02-12</bid_date>
  </bid_tuple>
</bids>);


(: =========================================================== :)
(: Data for SGML: Standard Generalized Markup Language :)

xdmp:document-insert("sgml.xml",
<report>
  <title>Getting started with SGML</title>
  <chapter>
    <title>The business challenge</title>
    <intro>
      <para>With the ever-changing and growing global market, companies and
        large organizations are searching for ways to become more viable and
        competitive. Downsizing and other cost-cutting measures demand more
        efficient use of corporate resources. One very important resource is
        an organization's information.</para>
      <para>As part of the move toward integrated information management,
        whole industries are developing and implementing standards for
        exchanging technical information. This report describes how one such
        standard, the Standard Generalized Markup Language (SGML), works as
        part of an overall information management strategy.</para>
      <graphic graphname="infoflow"/></intro></chapter>
  <chapter>
    <title>Getting to know SGML</title>
    <intro>
      <para>While SGML is a fairly recent technology, the use of
        <emph>markup</emph> in computer-generated documents has existed for a
        while.</para></intro>
    <section shorttitle="What is markup?">
      <title>What is markup, or everything you always wanted to know about
        document preparation but were afraid to ask?</title>
      <intro>
        <para>Markup is everything in a document that is not content. The
          traditional meaning of markup is the manual <emph>marking</emph> up
          of typewritten text to give instructions for a typesetter or
          compositor about how to fit the text on a page and what typefaces to
          use. This kind of markup is known as <emph>procedural markup</emph>.</para></intro>
      <topic topicid="top1">
        <title>Procedural markup</title>
        <para>Most electronic publishing systems today use some form of
          procedural markup. Procedural markup codes are good for one
          presentation of the information.</para></topic>
      <topic topicid="top2">
        <title>Generic markup</title>
        <para>Generic markup (also known as descriptive markup) describes the
          <emph>purpose</emph> of the text in a document. A basic concept of
          generic markup is that the content of a document must be separate from
          the style. Generic markup allows for multiple presentations of the
          information.</para></topic>
      <topic topicid="top3">
        <title>Drawbacks of procedural markup</title>
          <para>Industries involved in technical documentation increasingly
            prefer generic over procedural markup schemes. When a company changes
            software or hardware systems, enormous data translation tasks arise,
            often resulting in errors.</para></topic></section>
    <section shorttitle="What is SGML?">
      <title>What <emph>is</emph> SGML in the grand scheme of the universe, anyway?</title>
      <intro>
        <para>SGML defines a strict markup scheme with a syntax for defining
          document data elements and an overall framework for marking up
          documents.</para>
        <para>SGML can describe and create documents that are not dependent on
          any hardware, software, formatter, or operating system. Since SGML documents
          conform to an international standard, they are portable.</para></intro></section>
    <section shorttitle="How does SGML work?">
      <title>How is SGML and would you recommend it to your grandmother?</title>
      <intro>
        <para>You can break a typical document into three layers: structure,
          content, and style. SGML works by separating these three aspects and
          deals mainly with the relationship between structure and content.</para></intro>
      <topic topicid="top4">
        <title>Structure</title>
        <para>At the heart of an SGML application is a file called the DTD, or
          Document Type Definition. The DTD sets up the structure of a document,
          much like a database schema describes the types of information it
          handles.</para>
        <para>A database schema also defines the relationships between the
          various types of data. Similarly, a DTD specifies <emph>rules</emph>
          to help ensure documents have a consistent, logical structure.</para></topic>
      <topic topicid="top5">
        <title>Content</title>
        <para>Content is the information itself. The method for identifying
          the information and its meaning within this framework is called
          <emph>tagging</emph>. Tagging must
          conform to the rules established in the DTD (see <xref xrefid="top4"/>).</para>
        <graphic graphname="tagexamp"/></topic>
      <topic topicid="top6">
        <title>Style</title>
        <para>SGML does not standardize style or other processing methods for
          information stored in SGML.</para></topic></section></chapter>
  <chapter>
    <title>Resources</title>
    <section>
      <title>Conferences, tutorials, and training</title>
      <intro>
        <para>The Graphic Communications Association has been
          instrumental in the development of SGML. GCA provides conferences,
          tutorials, newsletters, and publication sales for both members and
          non-members.</para>
        <para security="c">Exiled members of the former Soviet Union's secret
          police, the KGB, have infiltrated the upper ranks of the GCA and are
          planning the Final Revolution as soon as DSSSL is completed.</para>
      </intro>
    </section>
  </chapter>
</report>);


(: =========================================================== :)
(: Data for STRING: String Search :)

xdmp:document-insert("string.xml",
<news>
<news_item>
   <title> Gorilla Corporation acquires YouNameItWeIntegrateIt.com </title>
   <content>
      <par> Today, Gorilla Corporation announced that it will purchase
          YouNameItWeIntegrateIt.com. The shares of
          YouNameItWeIntegrateIt.com dropped $3.00 as a result of this
          announcement.
      </par>

      <par> As a result of this acquisition, the CEO of
          YouNameItWeIntegrateIt.com Bill Smarts resigned. He did not
          announce what he will do next.  Sources close to
          YouNameItWeIntegrateIt.com hint that Bill Smarts might be
          taking a position in Foobar Corporation.
      </par>

      <par>YouNameItWeIntegrateIt.com is a leading systems integrator
          that enables <quote>brick and mortar</quote> companies to
          have a presence on the web.
      </par>

   </content>
   <date>1-20-2000</date>
   <author>Mark Davis</author>
   <news_agent>News Online</news_agent>
</news_item>

<news_item>
   <title>Foobar Corporation releases its new line of Foo products
   today</title>
   <content>
      <par> Foobar Corporation releases the 20.9 version of its Foo
            products.  The new version of Foo products solve known
            performance problems which existed in 20.8 line and
            increases the speed of Foo based products tenfold. It also
            allows wireless clients to be connected to the Foobar
            servers.
      </par>
      <par> The President of Foobar Corporation announced that they
            were proud to release 20.9 version of Foo products and
            they will upgrade existing customers <footnote>where
            service agreements exist</footnote>
            promptly. TheAppCompany Inc. immediately announced that it
            will release the new version of its products to utilize
            the 20.9 architecture within the next three months.
      </par>
      <figure>
          <title>Presidents of Foobar Corporation and TheAppCompany
          Inc. Shake Hands</title> <image source="handshake.jpg"/>
      </figure>
   </content>
   <date>1-20-2000</date>
   <news_agent>Foobar Corporation</news_agent>
</news_item>

<news_item> <title>Foobar Corporation is suing Gorilla Corporation for
   patent infringement </title>
   <content>
      <par> In surprising developments today, Foobar Corporation
         announced that it is suing Gorilla Corporation for patent
         infringement. The patents that were mentioned as part of the
         lawsuit are considered to be the basis of Foobar
         Corporation's <quote>Wireless Foo</quote> line of products.
      </par>
      <par>The tension between Foobar and Gorilla Corporations has
         been increasing ever since the Gorilla Corporation acquired
         more than 40 engineers who have left Foobar Corporation,
         TheAppCompany Inc. and YouNameItWeIntegrateIt.com over the
         past 3 months. The engineers who have left the Foobar
         corporation and its partners were rumored to be working on
         the next generation of server products and applications which
         will directly compete with Foobar's Foo 20.9 servers. Most of
         the engineers have relocated to Hawaii where the Gorilla
         Corporation's server development is located.
      </par>
   </content>
   <date>1-20-2000</date>
   <news_agent>Reliable News Corporation</news_agent>
</news_item>
</news>);

xdmp:document-insert("company-data.xml",
<company>
   <name>Foobar Corporation</name>
   <ticker_symbol>FOO</ticker_symbol>

   <description>Foobar Corporation is a maker of Foo(TM) and
        Foobar(TM) products and a leading software company with a 300
        Billion dollar revenue in 1999. It is located in Alaska.
   </description>

   <business_code>Software</business_code>
   <partners>
        <partner>YouNameItWeIntegrateIt.com</partner>
        <partner>TheAppCompany Inc.</partner>
   </partners>
   <competitors>
        <competitor>Gorilla Corporation</competitor>
   </competitors>
</company>);


(: =========================================================== :)
(: Data for NS: Queries Using Namespaces :)

xdmp:document-insert("auction.xml",
<ma:AuctionWatchList
    xmlns:ma="http://www.example.com/AuctionWatch"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:anyzone="http://www.example.com/auctioneers#anyzone"
    xmlns:eachbay="http://www.example.com/auctioneers#eachbay"
    xmlns:yabadoo="http://www.example.com/auctioneers#yabadoo"
>

<!-- ________________________________________________________________________________ -->

<ma:Auction anyzone:ID="0321K372910">

    <ma:AuctionHomepage
        xlink:type="simple"
        xlink:href="http://www.example.com/item/0321K372910"
    />

    <ma:Schedule>
        <ma:Open    xmlns:dt="http://www.w3.org/2001/XMLSchema"
                dt:type="timeInstant">2000-03-21:07:41:34-05:00</ma:Open>
        <ma:Close    xmlns:dt="http://www.w3.org/2001/XMLSchema"
                dt:type="timeInstant">2000-03-23:07:41:34-05:00</ma:Close>
    </ma:Schedule>
    
    <ma:Price>
        <ma:Start ma:currency="USD">3.00</ma:Start>
        <ma:Current ma:currency="USD">10.00</ma:Current>
        <ma:Number_of_Bids>5</ma:Number_of_Bids>
    </ma:Price>

    <ma:Trading_Partners>
        <ma:High_Bidder>
            <eachbay:ID>RecordsRUs</eachbay:ID>
            <eachbay:PositiveComments>231</eachbay:PositiveComments>
            <eachbay:NeutralComments>2</eachbay:NeutralComments>
            <eachbay:NegativeComments>5</eachbay:NegativeComments>
            <ma:MemberInfoPage
                xlink:type="simple"
                xlink:href="http://auction.eachbay.com/members?get=RecordsRUs"
                xlink:role="ma:MemberInfoPage"
            />            
        </ma:High_Bidder>
        <ma:Seller>
            <anyzone:ID>VintageRecordFreak</anyzone:ID>
            <anyzone:Member_Since>October 1999</anyzone:Member_Since>
            <anyzone:Rating>5</anyzone:Rating>
            <ma:MemberInfoPage
               xlink:type="simple"
               xlink:href="http://auction.anyzone.com/members/VintageRecordFreak"
               xlink:role="ma:MemberInfoPage"
            />
        </ma:Seller>
    </ma:Trading_Partners>

    <ma:Details>
        <record xmlns="http://www.example.org/music/records">
            <artist>Miles Davis</artist>
            <title>In a Silent Way</title>
            <recorded>1969</recorded>
            <label>Columbia Records</label>

            <remark>With Miles Davis (trumpet), Herbie Hancock (Electric
                Piano), Chick Corea (Electric Piano), Wayne Shorter
                (Tenor Sax), Josef Zawinul (Electric Piano &amp;
                Organ), John McLaughlin (Guitar), and Tony Williams
                (Drums).  The liner notes were written by Frank Glenn,
                and the record is in fine condition.</remark>

        </record>
    </ma:Details>

</ma:Auction>

<!-- ________________________________________________________________________________ -->


<ma:Auction yabadoo:ID="13143816">

    <ma:AuctionHomepage
        xlink:type="simple"
        xlink:href="http://auctions.yabadoo.com/auction/13143816"
    />

    <ma:Schedule>
        <ma:Open    xmlns:dt="http://www.w3.org/2001/XMLSchema"
                dt:type="timeInstant">2000-03-19:17:03:00-04:00</ma:Open>
        <ma:Close    xmlns:dt="http://www.w3.org/2001/XMLSchema"
                dt:type="timeInstant">2000-03-29:17:03:00-04:00</ma:Close>
    </ma:Schedule>
    
    <ma:Price>
        <ma:Start ma:currency="USD">3.00</ma:Start>
        <ma:Current ma:currency="USD">3.00</ma:Current>
        <ma:Number_of_Bids>0</ma:Number_of_Bids>
    </ma:Price>

    <ma:Trading_Partners>
        <ma:High_Bidder>
            <eachbay:ID>VintageRecordFreak</eachbay:ID>
            <eachbay:PositiveComments>232</eachbay:PositiveComments>
            <eachbay:NeutralComments>0</eachbay:NeutralComments>
            <eachbay:NegativeComments>0</eachbay:NegativeComments>
            <ma:MemberInfoPage
                xlink:type="simple"
                xlink:href="http://auction.eachbay.com/showRating/user=VintageRecordFreak"
                xlink:role="ma:MemberInfoPage"
            />            
        </ma:High_Bidder>
        <ma:Seller xmlns:seller="http://www.example.com/auctioneers#eachbay">
            <seller:ID>StarsOn45</seller:ID>
            <seller:PositiveComments>80</seller:PositiveComments>
            <seller:NeutralComments>1</seller:NeutralComments>
            <seller:NegativeComments>2</seller:NegativeComments>
            <ma:MemberInfoPage
                xlink:type="simple"
                xlink:href="http://auction.eachbay.com/showRating/user=StarsOn45"
                xlink:role="ma:MemberInfoPage"
            />            
        </ma:Seller>
    </ma:Trading_Partners>

    <ma:Details>
        <record xmlns="http://www.example.org/music/records">
            <artist>Wynton Marsalis</artist>
            <title>Think of One ...</title>
            <recorded>1983</recorded>
            <label>Columbia Records</label>
            <remark xml:lang="en">Columbia Records 12" 33-1/3 rpm LP,
                #FC-38641, Stereo. The record is still clean and shiny
                and looks unplayed (looks like NM condition).  The
                cover has very light surface and edge wear.</remark>
            <remark xml:lang="de">Columbia Records 12" 33-1/3 rpm LP,
                #FC-38641, Stereo. Die Platte ist noch immer sauber
                und gl√§nzend und sieht ungespielt aus
                (NM Zustand). Das Cover hat leichte Abnutzungen an
                Oberfl√§che und Ecken.</remark>
        </record>
    </ma:Details>

</ma:Auction>         

</ma:AuctionWatchList>);


(: =========================================================== :)
(: Data for PARTS: Recursive Parts Explosion :)

xdmp:document-insert("partlist.xml",
<partlist>
  <part partid="0" name="car"/>
  <part partid="1" partof="0" name="engine"/>
  <part partid="2" partof="0" name="door"/>
  <part partid="3" partof="1" name="piston"/>
  <part partid="4" partof="2" name="window"/>
  <part partid="5" partof="2" name="lock"/>
  <part partid="10" name="skateboard"/>
  <part partid="11" partof="10" name="board"/>
  <part partid="12" partof="10" name="wheel"/>
  <part partid="20" name="canoe"/>
</partlist>
);


(: =========================================================== :)
(: Data for STRONG: ueries that exploit strongly typed data :)

xdmp:eval-in('xdmp:document-insert("ipo.xsd",
<schema targetNamespace="http://www.example.com/IPO"
        xmlns="http://www.w3.org/2001/XMLSchema"
        xmlns:ipo="http://www.example.com/IPO">

  <annotation>
    <documentation xml:lang="en">
      International Purchase order schema for Example.com
      Copyright 2000 Example.com. All rights reserved.
    </documentation>
  </annotation>

  <!-- include address constructs -->
  <include
    schemaLocation="address.xsd"/>

  <element name="purchaseOrder" type="ipo:PurchaseOrderType"/>

  <element name="comment" type="string"/>
  <element name="shipComment" type="string" substitutionGroup="ipo:comment"/>
  <element name="customerComment" type="string" substitutionGroup="ipo:comment"/>

  <complexType name="PurchaseOrderType">
    <sequence>
      <element name="shipTo"     type="ipo:Address"/>
      <element name="billTo"     type="ipo:Address"/>
      <element ref="ipo:comment" minOccurs="0"/>
      <element name="items"      type="ipo:Items"/>
    </sequence>
    <attribute name="orderDate" type="date"/>
  </complexType>

  <complexType name="Items">
    <sequence>
      <element name="item" minOccurs="0" maxOccurs="unbounded">
        <complexType>
          <sequence>
            <element name="productName" type="string"/>
            <element name="quantity">
              <simpleType>
                <restriction base="positiveInteger">
                  <maxExclusive value="100"/>
                </restriction>
              </simpleType>
            </element>
            <element name="USPrice"    type="decimal"/>
            <element ref="ipo:comment" minOccurs="0" maxOccurs="unbounded"/>
            <element name="shipDate"   type="date" minOccurs="0" maxOccurs="unbounded"/>
          </sequence>
          <attribute name="partNum" type="ipo:SKU" use="required"/>
        </complexType>
      </element>
    </sequence>
  </complexType>

  <simpleType name="SKU">
    <restriction base="string">
      <pattern value="\d{{3}}-[A-Z]{{2}}"/>
    </restriction>
  </simpleType>

</schema>
)', xdmp:schema-database());

xdmp:eval-in ('xdmp:document-insert("address.xsd",
<schema targetNamespace="http://www.example.com/IPO" 
        xmlns="http://www.w3.org/2001/XMLSchema" 
        xmlns:ipo="http://www.example.com/IPO">

 <annotation>
   <documentation xml:lang="en">
     Addresses for International Purchase order schema
     Copyright 2000 Example.com. All rights reserved.
   </documentation>
 </annotation>

 <complexType name="Address">
   <sequence>
     <element name="name" type="string"/>
     <element name="street" type="string"/>
     <element name="city" type="string"/>
   </sequence>
 </complexType>

 <complexType name="USAddress">
   <complexContent>
     <extension base="ipo:Address">
       <sequence>
         <element name="state" type="ipo:USState"/>
         <element name="zip" type="positiveInteger"/>
       </sequence>
     </extension>
   </complexContent>
 </complexType>

 <complexType name="UKAddress">
   <complexContent>
     <extension base="ipo:Address">
       <sequence>
         <element name="postcode" type="ipo:UKPostcode"/>
       </sequence>
       <attribute name="exportCode" type="positiveInteger" fixed="1"/>
     </extension>
   </complexContent>
 </complexType>

 <!-- other Address derivations for more countries -->

 <simpleType name="USState">
   <restriction base="string">
     <enumeration value="AK"/>
     <enumeration value="AL"/>
     <enumeration value="AR"/>
     <!-- and so on ... -->
     <enumeration value="PA"/>
   </restriction>
 </simpleType>

 <!-- simple type definition for UKPostcode -->

 <simpleType name="UKPostcode">
    <restriction base="string">
        <pattern value="[A-Z]{{1,2}}[0-9R][0-9A-Z]? [0-9][A-Z]{{2}}"/>
    </restriction>
 </simpleType>
</schema>    
)', xdmp:schema-database());

xdmp:document-insert("ipo.xml",
<ipo:purchaseOrder
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:ipo="http://www.example.com/IPO"
  orderDate="1999-12-01">

    <shipTo exportCode="1" xsi:type="ipo:UKAddress">
        <name>Helen Zoe</name>
        <street>47 Eden Street</street>
        <city>Cambridge</city>
        <postcode>CB1 1JR</postcode>
    </shipTo>

    <billTo xsi:type="ipo:USAddress">
        <name>Robert Smith</name>
        <street>8 Oak Avenue</street>
        <city>Old Town</city>
        <state>PA</state>
        <zip>95819</zip>
    </billTo>

    <items>
        <item partNum="833-AA">
            <productName>Lapis necklace</productName>
            <quantity>1</quantity>
            <USPrice>99.95</USPrice>
            <ipo:shipComment>
              Use gold wrap if possible
            </ipo:shipComment>
            <ipo:customerComment>
              Want this for the holidays!
            </ipo:customerComment>
            <shipDate>1999-12-05</shipDate>
        </item>
    </items> 

</ipo:purchaseOrder> 
);

xdmp:eval-in ('xdmp:document-insert("zips.xsd",
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" 
           elementFormDefault="qualified" 
                   targetNamespace="http://www.example.com/zips" 
                   xmlns:zips="http://www.example.com/zips">

  <xs:element name="zips">
    <xs:complexType>
      <xs:sequence>
        <xs:element maxOccurs="unbounded" ref="zips:row"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="row">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="zips:city"/>
        <xs:element ref="zips:state"/>
        <xs:element ref="zips:zip"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="city" type="xs:string"/>
  <xs:element name="state" type="xs:string"/>
  <xs:element name="zip" type="xs:integer"/>
</xs:schema>    
)', xdmp:schema-database());


xdmp:document-insert("zips.xml",
<zips xmlns="http://www.example.com/zips">
  <row>
      <city>Old Town</city>       
      <state>PA</state>       
      <zip>95819</zip>
  </row>
  <row>
      <city>Durham</city> 
      <state>NC</state>       
      <zip>27701</zip>
  </row>  
  <row>
      <city>Durham</city> 
      <state>NC</state>       
      <zip>27703</zip>
  </row>
</zips>
);

xdmp:eval-in ('xdmp:document-insert("postals.xsd",
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" 
           elementFormDefault="qualified" 
           targetNamespace="http://www.example.com/postals" 
           xmlns:postals="http://www.example.com/postals">

  <xs:element name="postals">
    <xs:complexType>
      <xs:sequence>
        <xs:element maxOccurs="unbounded" ref="postals:row"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="row">
    <xs:complexType>
      <xs:sequence>
        <xs:element ref="postals:city"/>
        <xs:element ref="postals:prefix"/>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
  <xs:element name="city" type="xs:string"/>
  <xs:element name="prefix" type="xs:string"/>
</xs:schema>    
)', xdmp:schema-database());

xdmp:document-insert("postals.xml",
<postals xmlns="http://www.example.com/postals">
  <row>
    <city>Cambridge</city>
    <prefix>CB</prefix>
  </row>
  <row>
    <city>Oxford</city>
    <prefix>OX</prefix>
  </row>  
</postals>);

xdmp:document-insert("deadbeats.xml",
<deadbeats>
    <row>
        <name>Dick Dastardly</name>
        <creditrating>0</creditrating>
    </row>
    <row>
        <name>Peter Doubt</name>
        <creditrating>1</creditrating>
    </row>
        <row>
                <name>Robert Smith</name>
                <creditrating>0</creditrating>
        </row>
</deadbeats>);



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Mark Logic XQuery Use Cases Demo</title>
<link rel="stylesheet" href="use-cases.css"/>
</head>
<body>
<table width="100%">
<tr>
  <td class="title" colspan="2">Source XML Loaded</td>
</tr>
<tr>
  <td colspan="2">
    The source XML has been sucessfully loaded into the database.
  </td>
</tr>
</table>
</body>
</html>
