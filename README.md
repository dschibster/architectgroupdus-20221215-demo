# What does this repo contain?

This repo contains the metadata I used in my Scratch Org for my Architect Group Düsseldorf talk on 2022-12-15. In this repo I show example use cases for the packages I discussed:

* Nebula Logger (https://github.com/jongpie/NebulaLogger)
* Apex Rollup (https://github.com/jamessimone/apex-rollup)
* SFDX Batch Orchestrator (https://github.com/dschibster/sfdx-batch-orchestrator)

# Script to get started with packages + test metadata

```bash
echo "y" | sfdx force:package:install -p 04t5Y0000023RBpQAM -w 60
sfdx force:package:beta:install -p 04t6g000007zMCdAAM -w 60
sfdx force:package:beta:install -p 04t09000000ijP5AAI -w 60

sfdx force:source:push

sfdx force:user:permset:assign -n Batch_Job_Scheduler
sfdx force:user:permset:assign -n See_Rollup_App 
sfdx force:user:permset:assign -n LoggerAdmin
```

After Pushing all content, go into Custom Settings and enable the Org-Wide Setting for Rollup Settings by creating it. 
