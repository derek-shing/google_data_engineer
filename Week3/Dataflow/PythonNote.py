#Setup pipline

with beam.Pipeline (options =pipeline_options) as p:


#Read Data
    lines = p | beam.io.ReadFromText("gs://....") #Read from Cloud Storage
    lines = p | beam.io.ReadStringsFromPubSub("topic=know_args.input_topic") #Read from ReadStringsFromPubSub
    query = "SELECT * FROM [probject:dataset.tablename]"
    BQ_source =beam.io.BigQuerySource(query=<query>, use_standard_sql=True)
    BQ_data =p |beam.io.Read(BQ_source) #Read from BigQuerySource


#Write Data

from apache_beam.io.gcp.internal.clients import bigquery

table_spec = biguery.TableReference(projectId='...', datasetId='', tableId='')

p|beam.io.WriteToBigQery(
    table_spec,
    schema= table_schema,

)


#write small dataset like lookup table



#Aggregating with GroupByKey and Combine

cityAndZipcodes = p|beam.Map(lambda field:(field[0], field[1]))

group = cityAndZipcodes | beam.GroupByKey()


#MapReduce

#side window
