API end the assignment was based off of: https://themealdb.com/api.php

Please see the `Resources` folder for full instructions

Additional notes:
- Compiled using Version 15.0.1 (15A507)
- Target Version: iOS 17 and tested on a simulator iPhone 15 and actual iPhone 15 Pro device
- Using MVVM as a base architecture 

- No additional steps needed to run the project.

Summary:
The `DessertList` view / viewModel uses the `https://themealdb.com/api/json/v1/1/filter.php?c=Dessert` endpoint to display a list of each Dessert name + thumbnail image
Each decoded `Dessert` has an `id` which is used to fetch `https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID` endpoint and managed via the `DessertDetail` view / viewModel

Networking is modularized outside of the viewModels and modelled via the HTTPRequest / HTTPClient file(s)

To prevent subsequent requests for the Detail view(s) an internal cache is used to manage pages we have visited already.
