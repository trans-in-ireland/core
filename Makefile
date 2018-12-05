all: publish

publish:
	@ echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
	hugo
	cd public
	git add .
	git commit -m "Automatic rebuild $(date -u)"
	# git push origin master
