#!/bin/zsh

#  generate-docs.sh
#  RangeUISlider
#
#  Created by Fabrizio Duroni on 04.10.17.
#  2020 Fabrizio Duroni.

jazzy \
  --output docs \
  --module RangeUISlider \
  --xcodebuild-arguments -project,RangeUISlider.xcodeproj,-scheme,"RangeUISlider" \
  --author_url https://www.fabrizioduroni.it \
  --github_url https://github.com/chicio/ID3TagEditor \
  --copyright "2020 [Fabrizio Duroni](https://www.fabrizioduroni.it)"
