
printf "core pub get\n"
cd core || exit
flutter clean && flutter clean cache && flutter pub get
cd ..
printf '\n\n'

printf "core_ui pub get\n"
cd core_ui || exit
flutter clean && flutter clean cache && flutter pub get
cd ..
printf '\n\n'

printf "test pub get\n"
cd test || exit
flutter clean && flutter clean cache && flutter pub get
cd ..
printf '\n\n'

printf "data pub get\n"
cd data || exit
flutter clean && flutter clean cache && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
cd ..
printf '\n\n'

printf "domain pub get\n"
cd domain || exit
flutter clean && flutter clean cache && flutter pub get
cd ..
printf '\n\n'

printf "navigation pub get\n"
cd navigation || exit
flutter clean && flutter clean cache && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
cd ..
printf '\n\n'

printf "auth pub get\n"
cd features/auth || exit
flutter clean && flutter clean cache && flutter pub get
cd ../..
printf '\n\n'

printf "home pub get\n"
cd features/home || exit
flutter clean && flutter clean cache && flutter pub get
cd ../..
printf '\n\n'

printf "product details pub get\n"
cd features/product_details || exit
flutter clean && flutter clean cache && flutter pub get
cd ../..
printf '\n\n'

printf "order pub get\n"
cd features/order || exit
flutter clean && flutter clean cache && flutter pub get
cd ../..
printf '\n\n'

printf "settings pub get\n"
cd features/settings || exit
flutter clean && flutter clean cache && flutter pub get
cd ../..
printf '\n\n'
