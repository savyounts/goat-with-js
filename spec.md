# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
  • a user has_many trips

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
  • a trip belongs_to a user

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
  • a trip has_many destinations through plans, destinations have many trips through plans

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
  • users have many destinations through comments which have a content field for the user to fill in

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  • most fields are required to be filled in, some also require uniqueness

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  • a destination's comments are ordered by the most likes

- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  • facebook login
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  • trips, plans, comments, and destinations have at least one nested route
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  • new trip is nested under user
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  •errors show when not valid

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
