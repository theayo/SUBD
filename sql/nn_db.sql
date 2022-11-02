CREATE TABLE "dish" (
  "id" INTEGER NOT NULL,
  "name" VARCHAR(50) NOT NULL,
  "type" VARCHAR(255) NOT NULL,
  "category" VARCHAR(255) NOT NULL,
  "taste" VARCHAR(255) NOT NULL,
  "avg_mark" INTEGER NOT NULL,
  "recipe_id" INTEGER NOT NULL
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
  "status" INTEGER NOT NULL
);

CREATE TABLE "review" (
  "id" INTEGER NOT NULL,
  "title" VARCHAR(50) NOT NULL,
  "text" VARCHAR(50) NOT NULL,
  "mark_value" INTEGER NOT NULL,
  "author_review" INTEGER NOT NULL
);

CREATE TABLE "Moderator" (
  "id" INTEGER NOT NULL,
  "user_id" INTEGER NOT NULL,
  "department" CHAR(2) NOT NULL
);

CREATE TABLE "Mark" (
  "id" INTEGER NOT NULL,
  "value" INTEGER NOT NULL,
  "rate_date" timestamp(0) NOT NULL,
  "user" INTEGER NOT NULL,
  "recipe_id" INTEGER NOT NULL
);

CREATE TABLE "Recipe" (
  "id" INTEGER NOT NULL,
  "author_id" INTEGER NOT NULL,
  "Ingredients" INTEGER NOT NULL,
  "review" INTEGER NOT NULL,
  "text" VARCHAR(255) NOT NULL,
  "difficulty" INTEGER NOT NULL,
  "cook_time" datetime
);

CREATE TABLE "Post" (
  "id" INTEGER NOT NULL,
  "post_title" VARCHAR(20) NOT NULL,
  "post_text" VARCHAR(255) NOT NULL,
  "author_id" INTEGER NOT NULL
);

CREATE TABLE "Logs" (
  "user_id" INTEGER NOT NULL,
  "action_text" VARCHAR(255) NOT NULL,
  "date_time" timestamp(0) NOT NULL
);

ALTER TABLE "dish" ADD CONSTRAINT "dish_recipe_id_foreign" FOREIGN KEY ("recipe_id") REFERENCES "Recipe" ("id");

ALTER TABLE "Author" ADD CONSTRAINT "author_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "User" ("id");

ALTER TABLE "Mark" ADD CONSTRAINT "mark_user_foreign" FOREIGN KEY ("user") REFERENCES "User" ("id");

ALTER TABLE "Recipe" ADD CONSTRAINT "recipe_review_foreign" FOREIGN KEY ("review") REFERENCES "review" ("id");

ALTER TABLE "review" ADD CONSTRAINT "review_author_review_foreign" FOREIGN KEY ("author_review") REFERENCES "User" ("id");

ALTER TABLE "Moderator" ADD CONSTRAINT "moderator_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "User" ("id");

ALTER TABLE "Mark" ADD CONSTRAINT "mark_recipe_id_foreign" FOREIGN KEY ("recipe_id") REFERENCES "Recipe" ("id");

ALTER TABLE "Recipe" ADD CONSTRAINT "recipe_author_id_foreign" FOREIGN KEY ("author_id") REFERENCES "Author" ("id");

ALTER TABLE "Post" ADD CONSTRAINT "post_author_id_foreign" FOREIGN KEY ("author_id") REFERENCES "Author" ("id");

ALTER TABLE "Logs" ADD CONSTRAINT "log_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "User" ("id");
