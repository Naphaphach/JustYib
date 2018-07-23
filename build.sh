#!/usr/bin/env bash
# shellcheck disable=SC1000

# generate by 3.0.0
# link (https://github.com/Template-generator/script-genrating/tree/3.0.0)

# set -x #DEBUG - Display commands and their arguments as they are executed.
# set -v #VERBOSE - Display shell input lines as they are read.
# set -n #EVALUATE - Check syntax of the script but don't execute.

! command -v "flutter" && echo "flutter must need" && exit 1

flutter clean

flutter build apk --release || exit $?

test -f "./dist/android/app.apk" &&
  rm -rf ./dist/android/app.apk

cp -r ./build/app/outputs/apk/release/app-release.apk ./dist/android/app.apk || exit $?

git add -f "dist/android/app.apk"

echo "Build Android complete"

# -------------- IOS ---------------------

flutter build ios --release

echo "
TODO list:

1. check developer account
2. click Product -> archive
3. click Window -> organizer
4. click export.. 
5. choose development
6. APP IPA: https://raw.githubusercontent.com/kamontat/kcapstone-final-project/master/dist/ios/app/Runner.ipa
7. IMAGE: https://via.placeholder.com/57x57
8. IMAGE: https://via.placeholder.com/512x512
9. save as name 'app'
"

open ios/Runner.xcworkspace
