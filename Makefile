all: server

server:
	@bundle exec middleman server

build:
	@echo "[build] Building static site"
	@bundle exec middleman build --clean

deploy: build
	@echo "[deploy] Syncing s3://developers.finciero.com bucket"
	@aws s3 sync build/ s3://developers.finciero.com\
		--acl public-read\
		--cache-control "public, max-age=86400"\
		--region sa-east-1

.PHONY: build deploy all server
