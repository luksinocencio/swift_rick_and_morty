clean: ## Remove Pods folder, *xcodeproj, *xcworkspace, and SPM folders; Clean its cache and reinstall all dependencies.
	@rm -rf RickAndMorty.xcodeproj
	@find . -name '.DS_Store' -type f -delete

generate:
	@bash ./Scripts/killXcode.sh $(close)
	@rm -rf RickAndMorty.xcodeproj
	@find . -name '.DS_Store' -type f -delete
	@xcodegen generate
	@bash ./Scripts/posGenerate.sh $(open)

# Help make faster pull requests
pullrequest: ## Create a new PullRequest in Github web following template patterns
	@bash ./Scripts/pullrequest.sh