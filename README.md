# Mayo Firebase Storage

## CORS on web

Need to add [CORS configuration](https://firebase.google.com/docs/storage/web/download-files#cors_configuration) in the project

1. Save following configuration on your computer with name cors.json
```[json]
[
    {
        "origin": ["*"],
        "method": ["GET"],
        "maxAgeSeconds": 3600
    }
]
```

2. Install gsutil from https://cloud.google.com/storage/docs/gsutil_install
login with your gcloud credential on command line with gsutil

```
gsutil cors set cors.json gs://<your-cloud-storage-bucket>
```