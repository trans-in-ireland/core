all: publish

USER_NAME = $(shell git config --local user.name)
USER_EMAIL = $(shell git config --local user.email)

setup-user-name:
ifeq ($(USER_NAME),)
	@ echo user.name is not set
	@ echo use $$ git config --local user.name "Your Name"
	@ false
else
	@ git -C public config --local user.name "$(shell git config --local user.name)"
endif

setup-user-email:
ifeq ($(USER_EMAIL),)
	@ echo user.email is not set
	@ echo use $$ git config --local user.email your@email
	@ false
else
	@ git -C public config --local user.email "$(shell git config --local user.email)"
endif

setup: setup-user-name setup-user-email

render: setup revert
	@ echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
	hugo
	git -C public add .
	git -C public commit --allow-empty -m "Automatic rebuild at '$(shell date -u)'"

push:
	git -C public push origin master

publish: render
	@ $(MAKE) push

revert:
	git -C public reset --hard origin/master
