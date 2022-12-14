# Script to get started with packages + test metadata

```bash
echo "y" | sfdx force:package:beta:install -p 04t5Y0000023RBpQAM -w 60
sfdx force:package:beta:install -p 04t6g000007zMCdAAM -w 60
sfdx force:package:betga:install -p 04t09000000ijP5AAI -w 60
sfdx force:source:push
```

After Pushing all content, go into Custom Settings and enable the Org-Wide Setting for Rollup Settings by creating it. 