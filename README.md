# Download stats service

Get download stats for your npm packages.
Get and modify all data through `/download-stats`.

## Filtering

### Filter by package

`download-stats?package=@sap-cloud-sdk/util`

### Filter by package and major version

`download-stats?package=@sap-cloud-sdk/util@2`

### Filter by packages and major version

`download-stats?package[]=@sap-cloud-sdk/util@2&package[]=@sap/cds`

### Filter by date (inclusive)

`download-stats?startDate=2022-08-01&endDate=2022-08-31`
