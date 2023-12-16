#!/usr/bin/env bash

fvm flutter test test/design_assets --update-goldens --tags=golden

fvm flutter pub run flutter_launcher_icons
