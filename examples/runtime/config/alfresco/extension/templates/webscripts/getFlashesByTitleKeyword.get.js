function NewsFlash(title, body, launch_date){
    this.title = title;
    this.body = body;
    this.launch_date = launch_date;
}

var storeId = "benchmark"
var titleKeyword = args.titleKeyword

if (titleKeyword == undefined || titleKeyword == "")
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
        var results = avmStore.luceneSearch("@\\{http\\://www.alfresco.org/alfresco/osc/contentmodel\\}flashtitle:" + titleKeyword);
        var resultSet = new Array();
        for each (avmnode in results) {
            var flash = new NewsFlash(avmnode.properties["{http://www.alfresco.org/alfresco/osc/contentmodel}flashtitle"].toString(),
                    avmnode.properties["{http://www.alfresco.org/alfresco/osc/contentmodel}flashbody"].toString(),
                    avmnode.properties["{http://www.alfresco.org/alfresco/osc/contentmodel}flashlaunchdate"].toString());
            resultSet.push(flash);
        }

        model.resultSet = resultSet
    }
}
