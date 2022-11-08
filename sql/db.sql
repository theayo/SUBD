Table "dish" {
  "id" INTEGER [not null]
  "name" VARCHAR(50) [not null]
  "type_id" INTEGER [not null]
  "category_id" INTEGER [not null]
  "taste_id" INTEGER [not null]
  "avg_mark" INTEGER [not null]
  "recipe_id" INTEGER [not null]
}

Table "Category" {
  "id" INTEGER [not null]
  "name" VARCHAR(255) [not null]
}

Table "Taste" {
  "id" INTEGER [not null]
  "name" VARCHAR(255) [not null]
}

Table "Type" {
  "id" INTEGER [not null]
  "name" VARCHAR(255) [not null]
}

Table "Author" {
  "id" INTEGER [not null]
  "name" VARCHAR(50)
  "avg_mark" INTEGER [not null]
  "last_post" timestamp(0) [not null]
  "user_id" INTEGER [not null]
}

Table "User" {
  "id" INTEGER [not null]
  "name" VARCHAR(10) [not null]
  "login" VARCHAR(10) [not null]
  "passoword" VARCHAR(16) [not null]
  "email" VARCHAR(50) [not null]
  "date_reg" timestamp(0) [not null]
  "status_id" INTEGER [not null]
}

Table "Status" {
  "id" INTEGER [not null]
  "title" VARCHAR(255) [not null]
}

Table "Review" {
  "id" INTEGER [not null]
  "title" VARCHAR(50) [not null]
  "text_rev" VARCHAR(600) [not null]
  "mark_value" INTEGER [not null]
  "author_review" INTEGER [not null]
}

Table "Moderator" {
  "id" INTEGER [not null]
  "department_id" INTEGER [not null]
  "user_id" INTEGER [not null]
}

Table "Department" {
  "id" INTEGER [not null]
  "name" VARCHAR(65) [not null]
  "code" char(2) [not null]
}

Table "Mark" {
  "id" INTEGER [not null]
  "value" INTEGER [not null]
  "rate_date" timestamp(0) [not null]
  "user" INTEGER [not null]
}

Table "Difficulty" {
  "id" INTEGER [not null]
  "degree" INTEGER [not null]
  "time_to_cook" datetime(0) [not null]
  "recipe_id" INTEGER [not null]
}

Table "Recipe" {
  "id" INTEGER [not null]
  "author_id" INTEGER [not null]
  "Ingredients" INTEGER [not null]
  "review" INTEGER [not null]
  "text_recipe" VARCHAR(4000) [not null]
}

Table "Post" {
  "id" INTEGER [not null]
  "post_title" VARCHAR(255) [not null]
  "post_text" VARCHAR(4000) [not null]
  "author_id" INTEGER [not null]
}

Table "Products" {
  "id" INTEGER [not null]
  "name" VARCHAR(64) [not null]
  "price" INTEGER [not null]
}

Table "RecipeMark" {
  "mark_id" INTEGER [not null]
  "recipe_id" INTEGER [not null]
}

Table "RecipeProducts" {
  "recipe_id" INTEGER [not null]
  "product_id" INTEGER [not null]
}

Ref "dish_category_id_foreign":"Category"."id" < "dish"."category_id"

Ref "dish_taste_id_foreign":"Taste"."id" < "dish"."taste_id"

Ref "dish_recipe_id_foreign":"Recipe"."id" < "dish"."recipe_id"

Ref "author_user_id_foreign":"User"."id" < "Author"."user_id"

Ref "mark_user_foreign":"User"."id" < "Mark"."user"

Ref "recipe_review_foreign":"Review"."id" < "Recipe"."review"

Ref "review_author_review_foreign":"User"."id" < "Review"."author_review"

Ref "moderator_user_id_foreign":"User"."id" < "Moderator"."user_id"

Ref "difficulty_recipe_id_foreign":"Recipe"."id" < "Difficulty"."recipe_id"

Ref "recipe_author_id_foreign":"Author"."id" < "Recipe"."author_id"

Ref "post_author_id_foreign":"Author"."id" < "Post"."author_id"

Ref "recipeproducts_product_id_foreign":"Products"."id" < "RecipeProducts"."product_id"

Ref "recipeproducts_recipe_id_foreign":"Recipe"."id" < "RecipeProducts"."recipe_id"

Ref "recipemark_mark_id_foreign":"Mark"."id" < "RecipeMark"."mark_id"

Ref "recipemark_recipe_id_foreign":"Recipe"."id" < "RecipeMark"."recipe_id"

Ref "dish_type":"Type"."id" < "dish"."type_id"

Ref "moderator_department_id_foreign":"Moderator"."department_id" < "Department"."id"

Ref "user_status_id_foreign":"User"."status_id" < "Status"."id"
