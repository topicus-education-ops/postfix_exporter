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
			tags = [ "0.1.2" ]
		}
	}
	
	notify {
		emailNotificationRecipients = 'Sverre.Boschman@topicus.nl'
	}
}
