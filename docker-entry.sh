echo "Starting platform"
cd mattermost
exec ./bin/platform -config=/mm/mattermost/config/config_docker.json
