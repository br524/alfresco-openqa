function Article(title, author, location, teaser, body, launch_date){
    this.title = title;
    this.author = author;
    this.location = location;
    this.teaser = teaser;
    this.body = body;
    this.launch_date = launch_date;
}

var storeId = "benchmark"
var author = args.author

if (author == undefined || author == "")
{
    status.code = 500
    status.message = "No author was provided."
}
else
{
    var avmStore = avm.lookupStore(storeId)

    if (avmStore == undefined)
    {
        status.code = 500
        status.message = "Unable to find AVM store '" + storeId + "'."
    }
    else
    {
        var results = avmStore.luceneSearch("@\\{http\\://www.alfresco.org/alfresco/osc/contentmodel\\}articleauthor:" + author);
        var resultSet = new Array();
        for each (avmnode in results) {
            var article = new Article(avmnode.properties["{http://www.alfresco.org/alfresco/osc/contentmodel}articletitle"].toString(),
                    avmnode.properties["{http://www.alfresco.org/alfresco/osc/contentmodel}articleauthor"].toString(),
                    avmnode.properties["{http://www.alfresco.org/alfresco/osc/contentmodel}articlelocation"].toString(),
                    avmnode.properties["{http://www.alfresco.org/alfresco/osc/contentmodel}articleteaser"].toString(),
                    avmnode.properties["{http://www.alfresco.org/alfresco/osc/contentmodel}articlebody"].toString(),
                    avmnode.properties["{http://www.alfresco.org/alfresco/osc/contentmodel}articlelaunchdate"].toString());
            resultSet.push(article);
        }

        model.resultSet = resultSet
    }
}
