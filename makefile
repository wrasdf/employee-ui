.PHONY: ut apiut shui shapi api ui e2e stop clean eks

DCR := docker-compose run --rm
DCB := docker-compose build

ut:
	$(DCB) ut
	$(DCR) ut

ui:
	$(DCB) ui
	$(DCR) --service-ports ui

shui:
	$(DCB) shui
	$(DCR) shui

clean:
	docker stop $(shell docker ps -aq) && docker rm $(shell docker ps -aq)
	# docker volume rm $(docker volume ls -f driver=local | awk '{print $2}' | tail -n+2)

apply-%:
	$(DCR) ctpl validate -p cfns/envs/$(env).yaml -c $(*)
	$(DCR) ctpl apply -p cfns/envs/$(env).yaml -c $(*)

deploy-cloudfront:
	$(DCR) aws s3 cp ./app/ s3://employee.apollo-dev.platform.myobdev.com/ --recursive
	$(DCR) aws cloudfront create-invalidation --distribution-id EN5K6IJ2PYRK0 --paths /index.html /error.html

e2e:
	echo "TODO: This is E2E test."
