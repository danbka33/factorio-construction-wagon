
if mods["pyindustry"] then

    local constructionWagon = data.raw["cargo-wagon"]["construction-cargo-wagon"]
    local constructionWagonItem = data.raw["item-with-entity-data"]["construction-cargo-wagon"]

    local constructionWagonT2 = table.deepcopy(constructionWagon);
    constructionWagonT2.name = "construction-cargo-wagon-mk2"
    constructionWagonT2.minable = { mining_time = 0.5, result = "construction-cargo-wagon-mk2" }
    constructionWagonT2.inventory_size = settings.startup["construction-wagon-wagon-inventory-size"].value * 2

    local constructionWagonItemT2 =  table.deepcopy(constructionWagonItem);
    constructionWagonItemT2.name = "construction-cargo-wagon-mk2"
    constructionWagonItemT2.place_result = "construction-cargo-wagon-mk2";

    local constructionWagonRecipeT2 = table.deepcopy(data.raw["recipe"]["cargo-wagon"])
    constructionWagonRecipeT2.name = "construction-cargo-wagon-mk2"
    constructionWagonRecipeT2.results = { { type = "item", name = "construction-cargo-wagon-mk2", amount = 1 } }
    local mk2wagonIngredients = table.deepcopy(data.raw["recipe"]["mk02-wagon"].ingredients)
    local personalRoboportIngredients = table.deepcopy(data.raw["recipe"]["personal-roboport-equipment"].ingredients)
    local constructionWagonIngredientsT2 = doubleIngredients(mergeIngredients(mk2wagonIngredients, personalRoboportIngredients))
    constructionWagonRecipeT2.ingredients = constructionWagonIngredientsT2

    local constructionTrainResearchT2 = table.deepcopy(data.raw["technology"]["railway-mk02"])

    constructionTrainResearchT2.name = "construction-wagon-mk2"
    constructionTrainResearchT2.effects =
    {
        {
            type = "unlock-recipe",
            recipe = "construction-cargo-wagon-mk2"
        }
    }
    constructionTrainResearchT2.prerequisites = { "railway-mk02", "construction-wagon"}
    constructionTrainResearchT2.icon = "__construction-wagon__/graphics/technology/construction-wagon.png"
    constructionTrainResearchT2.icon_size = 1024

    local constructionWagonT3 = table.deepcopy(constructionWagon);
    constructionWagonT3.name = "construction-cargo-wagon-mk3"
    constructionWagonT3.minable = { mining_time = 0.5, result = "construction-cargo-wagon-mk3" }
    constructionWagonT3.inventory_size = settings.startup["construction-wagon-wagon-inventory-size"].value * 3

    local constructionWagonItemT3 =  table.deepcopy(constructionWagonItem);
    constructionWagonItemT3.name = "construction-cargo-wagon-mk3"
    constructionWagonItemT3.place_result = "construction-cargo-wagon-mk3";

    local constructionWagonRecipeT3 = table.deepcopy(data.raw["recipe"]["cargo-wagon"])
    constructionWagonRecipeT3.name = "construction-cargo-wagon-mk3"
    constructionWagonRecipeT3.results = { { type = "item", name = "construction-cargo-wagon-mk3", amount = 1 } }
    local mk3wagonIngredients = table.deepcopy(data.raw["recipe"]["ht-generic-wagon"].ingredients)
    local personalRoboportMk2Ingredients = table.deepcopy(data.raw["recipe"]["personal-roboport-mk2-equipment"].ingredients)
    local constructionWagonIngredientsT3 = doubleIngredients(mergeIngredients(mk3wagonIngredients, personalRoboportMk2Ingredients))
    constructionWagonRecipeT3.ingredients = constructionWagonIngredientsT3

    local constructionTrainResearchT3 = table.deepcopy(data.raw["technology"]["railway-mk03"])

    constructionTrainResearchT3.name = "construction-wagon-mk3"
    constructionTrainResearchT3.effects =
    {
        {
            type = "unlock-recipe",
            recipe = "construction-cargo-wagon-mk3"
        }
    }
    constructionTrainResearchT3.prerequisites = { "railway-mk03", "construction-wagon-mk2"}
    constructionTrainResearchT3.icon = "__construction-wagon__/graphics/technology/construction-wagon.png"
    constructionTrainResearchT3.icon_size = 1024

    local constructionWagonT4 = table.deepcopy(constructionWagon);
    constructionWagonT4.name = "construction-cargo-wagon-mk4"
    constructionWagonT4.minable = { mining_time = 0.5, result = "construction-cargo-wagon-mk4" }
    constructionWagonT4.inventory_size = settings.startup["construction-wagon-wagon-inventory-size"].value * 4

    local constructionWagonItemT4 =  table.deepcopy(constructionWagonItem);
    constructionWagonItemT4.name = "construction-cargo-wagon-mk4"
    constructionWagonItemT4.place_result = "construction-cargo-wagon-mk4";

    local constructionWagonRecipeT4 = table.deepcopy(data.raw["recipe"]["cargo-wagon"])
    constructionWagonRecipeT4.name = "construction-cargo-wagon-mk4"
    constructionWagonRecipeT4.results = { { type = "item", name = "construction-cargo-wagon-mk4", amount = 1 } }
    local mk4wagonIngredients = table.deepcopy(data.raw["recipe"]["mk04-wagon"].ingredients)
    local constructionWagonIngredientsT4 = doubleIngredients(mergeIngredients(mk4wagonIngredients, personalRoboportMk2Ingredients))
    constructionWagonRecipeT4.ingredients = constructionWagonIngredientsT4

    local constructionTrainResearchT4 = table.deepcopy(data.raw["technology"]["railway-mk04"])

    constructionTrainResearchT4.name = "construction-wagon-mk4"
    constructionTrainResearchT4.effects =
    {
        {
            type = "unlock-recipe",
            recipe = "construction-cargo-wagon-mk4"
        }
    }
    constructionTrainResearchT4.prerequisites = { "railway-mk04", "construction-wagon-mk3"}
    constructionTrainResearchT4.icon = "__construction-wagon__/graphics/technology/construction-wagon.png"
    constructionTrainResearchT4.icon_size = 1024

    data.extend({
        constructionWagonT2,  constructionWagonItemT2, constructionTrainResearchT2, constructionWagonRecipeT2,
        constructionWagonT3,  constructionWagonItemT3, constructionTrainResearchT3, constructionWagonRecipeT3,
        constructionWagonT4,  constructionWagonItemT4, constructionTrainResearchT4, constructionWagonRecipeT4
    })

end


