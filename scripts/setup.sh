echo "y" | sfdx force:package:install -p 04t5Y0000023RBpQAM -w 60
sfdx force:package:beta:install -p 04t6g000007zMCdAAM -w 60
sfdx force:package:beta:install -p 04t09000000ijP5AAI -w 60

sfdx force:source:push

sfdx force:user:permset:assign -n Batch_Job_Scheduler
sfdx force:user:permset:assign -n See_Rollup_App 
sfdx force:user:permset:assign -n LoggerAdmin