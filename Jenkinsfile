config.docker { }

node() {
	git.checkout { }

	catchError {
		dockerfile.validate { }

		def img = dockerfile.build {
			registry = 'docker.topicusonderwijs.nl'
			name = 'postfix/postfix_exporter'
		}

		dockerfile.publish {
			image = img
		}
	}
	
	gitlist()
	
	notify {
		emailNotificationRecipients = 'Sverre.Boschman@topicus.nl'
	}
}
