build:
	sam build --beta-features

deploy: build
	sam deploy \
		--stack-name=sam-vars-update \
		--no-confirm-changeset --no-fail-on-empty-changeset \
		--s3-bucket $(shell aws ssm get-parameter --name sam-bucket-name --query "Parameter.Value" --output text) \
		--capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND \
        --parameter-overrides \
            LogLevel="INFO"