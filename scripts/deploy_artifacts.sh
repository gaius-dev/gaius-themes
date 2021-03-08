#!/bin/bash
# Script to deploy Gaius theme(s) to a specific location

function main()
{
	if [[ "$#" -ne "1" ]]; then
		echo "Error: missing target path"
		exit 1
	fi

	deploy-artifacts $1
}

function deploy-artifacts() {

	deploy-default-theme $1
}

function deploy-default-theme() {

	if [[ -d $1/_themes/default ]]; then
		echo "Deleting existing 'default' theme in '$1/_themes/default'..."
		rm -rf $1/_themes/default
	fi

	mkdir -p $1/_themes/default

	echo "Deploying 'default' theme in '$1/_themes/default'..."
	cp -r ../_themes/default/* $1/_themes/default/
}

main "$@"