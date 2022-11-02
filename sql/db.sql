CREATE TABLE "dish" (
  "id" INTEGER NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "type_id" INTEGER NOT NULL,
  "category_id" INTEGER NOT NULL,
  "taste_id" INTEGER NOT NULL,
  "avg_mark" INTEGER NOT NULL,
  "recipe_id" INTEGER NOT NULL
);

CREATE TABLE "Category" (
  "id" INTEGER NOT NULL,
  "name" VARCHAR(255) NOT NULL
);

CREATE TABLE "Taste" (
  "id" INTEGER NOT NULL,
  "name" VARCHAR(255) NOT NULL
);

CREATE TABLE "Type" (
  "id" INTEGER NOT NULL,
  "name" VARCHAR(255) NOT NULL
);

CREATE TABLE "Author" (
  "id" INTEGER NOT NULL,
  "name" VARCHAR(50),
  "avg_mark" INTEGER NOT NULL,
  "last_post" timestamp(0) NOT NULL,
  "user_id" INTEGER NOT NULL
);

CREATE TABLE "User" (
  "id" INTEGER NOT NULL,
  "name" VARCHAR(10) NOT NULL,
  "login" VARCHAR(10) NOT NULL,
  "passoword" VARCHAR(16) NOT NULL,
  "email" VARCHAR(50) NOT NULL,
  "date_reg" timestamp(0) NOT NULL,
  "status_id" INTEGER NOT NULL
);

CREATE TABLE "Status" (
  "id" INTEGER NOT NULL,
  "title" VARCHAR(255) NOT NULL
);

CREATE TABLE "Review" (
  "id" INTEGER NOT NULL,
  "title" VARCHAR(50) NOT NULL,
  "text_rev" VARCHAR(600) NOT NULL,
  "mark_value" INTEGER NOT NULL,
  "author_review" INTEGER NOT NULL
);

CREATE TABLE "Moderator" (
  "id" INTEGER NOT NULL,
  "user_id" INTEGER NOT NULL,
  "department_id" INTEGER NOT NULL
);

CREATE TABLE "Department" (
  "id" INTEGER NOT NULL,
  "name" VARCHAR(65) NOT NULL,
  "code" char(2) NOT NULL
);

CREATE TABLE "Mark" (
  "id" INTEGER NOT NULL,
  "value" INTEGER NOT NULL,
  "rate_date" timestamp(0) NOT NULL,
  "user" INTEGER NOT NULL,
  "recipe_id" INTEGER NOT NULL
);

CREATE TABLE "Difficulty" (
  "id" INTEGER NOT NULL,
  "degree" INTEGER NOT NULL,
  "time_to_cook" datetime(0) NOT NULL,
  "recipe_id" INTEGER NOT NULL
);

CREATE TABLE "Recipe" (
  "id" INTEGER NOT NULL,
  "author_id" INTEGER NOT NULL,
  "Ingredients" INTEGER NOT NULL,
  "review" INTEGER NOT NULL,
  "text_recipe" VARCHAR(4000) NOT NULL
);

CREATE TABLE "Post" (
  "id" INTEGER NOT NULL,
  "post_title" VARCHAR(255) NOT NULL,
  "post_text" VARCHAR(4000) NOT NULL,
  "author_id" INTEGER NOT NULL
);

CREATE TABLE "Products" (
  "id" INTEGER NOT NULL,
  "name" VARCHAR(64) NOT NULL,
  "price" INTEGER NOT NULL
);

CREATE TABLE "RecipeMark" (
  "mark_id" INTEGER NOT NULL,
  "recipe_id" INTEGER NOT NULL
);

CREATE TABLE "RecipeProducts" (
  "recipe_id" INTEGER NOT NULL,
  "product_id" INTEGER NOT NULL
);

ALTER TABLE "dish" ADD CONSTRAINT "dish_category_id_foreign" FOREIGN KEY ("category_id") REFERENCES "Category" ("id");

ALTER TABLE "dish" ADD CONSTRAINT "dish_taste_id_foreign" FOREIGN KEY ("taste_id") REFERENCES "Taste" ("id");

ALTER TABLE "dish" ADD CONSTRAINT "dish_recipe_id_foreign" FOREIGN KEY ("recipe_id") REFERENCES "Recipe" ("id");

ALTER TABLE "Author" ADD CONSTRAINT "author_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "User" ("id");

ALTER TABLE "Mark" ADD CONSTRAINT "mark_user_foreign" FOREIGN KEY ("user") REFERENCES "User" ("id");

ALTER TABLE "Recipe" ADD CONSTRAINT "recipe_review_foreign" FOREIGN KEY ("review") REFERENCES "Review" ("id");

ALTER TABLE "Review" ADD CONSTRAINT "review_author_review_foreign" FOREIGN KEY ("author_review") REFERENCES "User" ("id");

ALTER TABLE "Moderator" ADD CONSTRAINT "moderator_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "User" ("id");

ALTER TABLE "Difficulty" ADD CONSTRAINT "difficulty_recipe_id_foreign" FOREIGN KEY ("recipe_id") REFERENCES "Recipe" ("id");

ALTER TABLE "Recipe" ADD CONSTRAINT "recipe_author_id_foreign" FOREIGN KEY ("author_id") REFERENCES "Author" ("id");

ALTER TABLE "Post" ADD CONSTRAINT "post_author_id_foreign" FOREIGN KEY ("author_id") REFERENCES "Author" ("id");

ALTER TABLE "RecipeProducts" ADD CONSTRAINT "recipeproducts_product_id_foreign" FOREIGN KEY ("product_id") REFERENCES "Products" ("id");

ALTER TABLE "RecipeProducts" ADD CONSTRAINT "recipeproducts_recipe_id_foreign" FOREIGN KEY ("recipe_id") REFERENCES "Recipe" ("id");

ALTER TABLE "RecipeMark" ADD CONSTRAINT "recipemark_mark_id_foreign" FOREIGN KEY ("mark_id") REFERENCES "Mark" ("id");

ALTER TABLE "RecipeMark" ADD CONSTRAINT "recipemark_recipe_id_foreign" FOREIGN KEY ("recipe_id") REFERENCES "Recipe" ("id");

ALTER TABLE "dish" ADD CONSTRAINT "=dish_type" FOREIGN KEY ("type_id") REFERENCES "Type" ("id");

ALTER TABLE "Department" ADD CONSTRAINT "moderator_department_id_foreign" FOREIGN KEY ("id") REFERENCES "Moderator" ("department_id");

ALTER TABLE "Status" ADD CONSTRAINT "user_status_id_foreign" FOREIGN KEY ("id") REFERENCES "User" ("status_id");
