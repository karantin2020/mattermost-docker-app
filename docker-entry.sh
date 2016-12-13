echo "Starting platform"
cd mattermost
exec ./bin/platform -config=config/config_docker.json
