Instructions for preparing and running ASR performance tests.  Note: These docs are based on 3.1.1 Enterprise.

1. In the "runtime" directory, run Ant.  This will result in two .amp files being built, located at runtime/build/dist.

2. Deploy runtime/build/dist/asrTestingModule-authoring.amp to an Alfresco WCM authoring server.

3. Deploy runtime/build/dist/asrTestingModule-asr.amp to an Alfresco ASR (on a separate Alfresco installation).

4. Start up both servers (authoring and ASR).

5. On the authoring server, create a web project.  Here are the details:
    A. Name: benchmark
    B. DNS Name: benchmark
    C. Deployment Servers
        i. ASR - specify the ASR host (I used the IP address)
        ii. Port: 50500
        iii. Username: admin
        iv. Password: admin
        v. Be sure to click "Add"
    D. Create web forms:
        i. article
            a. XSD: alfresco/extras/wcm/contentmodels/article/article.xsd
            b. Template: alfresco/extras/wcm/templates/article/article.xsl
            c. Template: alfresco/extras/wcm/templates/article/article-rss.xsl
                i. Output path pattern: ${name}-rss.${extension}
            d. Template: alfresco/extras/wcm/templates/article/article-list.xsl
                i. Output path pattern: ${name}-list.${extension}
            e. Template: alfresco/extras/wcm/templates/article/article-feature.xsl
                i. Output path pattern: ${name}-feature.${extension}
            f. No workflow
            g. Make sure to "Add to list" once the web form is created.
        ii. news-flash
            a. XSD: alfresco/extras/wcm/contentmodels/news-flash/news-flash.xsd
            b. Template: alfresco/extras/wcm/templates/news-flash/news-flash.xsl
            c. Template: alfresco/extras/wcm/templates/news-flash/news-flash-list.xsl
                i. Output path pattern: ${name}-list.${extension}
            d. Template: alfresco/extras/wcm/templates/news-flash/news-flash-feature.xsl
                i. Output path pattern: ${name}-feature.${extension}
            e. No workflow
            f. Make sure to "Add to list" once the web form is created.

6. Create content (either via Watir test suite or manually via the web forms), and submit to staging
    A. Be cognizant of what you enter for Author for Articles and the titles of news flashes.  The performance tests use
       both.
    B. I created 5 articles the length of a decent news article or blog post, and ten news flashes, each about a
       paragraph.  All content items I created have the same article author and the same word in the news flash title,
       so that all items will be returned by the ASR web scripts.

7. Deploy content to ASR

8. Run JMeter
