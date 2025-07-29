#!/bin/sh

set -e

pipx install flask

pipx install gunicorn

pipx inject gunicorn flask