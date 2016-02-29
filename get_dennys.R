data_dir = "data/dennys"

dir.create(data_dir, recursive = TRUE, showWarnings = FALSE)

limit = 1000
radius = 1000
zipcode = 90210

dennys_url = function(limit=1000, radius=1000, zip=90210)
{    
    paste0('https://hosted.where2getit.com/dennys/responsive/ajax?&xml_request=',
           '<request>',
           '<appkey>6B962D40-03BA-11E5-BC31-9A51842CA48B<%2Fappkey>',
           '<formdata+id%3D"locatorsearch">',
             '<dataview>store_default<%2Fdataview>',
             '<limit>',limit,'<%2Flimit>',
             '<order>rank%2C_distance<%2Forder>',
             '<geolocs>',
               '<geoloc>',
                  '<addressline>', zip, '<%2Faddressline>',
                  '<longitude><%2Flongitude>',
                  '<latitude><%2Flatitude>',
                  '<country>US<%2Fcountry>',
               '<%2Fgeoloc>',
             '<%2Fgeolocs>',
             '<stateonly>1<%2Fstateonly>',
             '<searchradius>', radius, '<%2Fsearchradius>',
           '<%2Fformdata>',
           '<%2Frequest>')
}

download.file(dennys_url(zip=90210), file.path(data_dir, paste0(90210,".xml")))
download.file(dennys_url(zip=27705), file.path(data_dir, paste0(27705,".xml")))
