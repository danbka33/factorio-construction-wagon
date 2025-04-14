-- Construction train with grid support
-- Copyright (C) 2025 danbka33

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>

data:extend({
    {
        type = "equipment-grid",
        name = "construction-wagon",
        width = settings.startup["construction-wagon-wagon-grid-width"].value,
        height = settings.startup["construction-wagon-wagon-grid-height"].value,
        equipment_categories = { "construction-wagon-equipment" }
    },
})

-- local constructionLocomotive = table.deepcopy(data.raw["locomotive"]["locomotive"])
local constructionWagon = table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])

-- constructionLocomotive.name = "construction-wagon"
-- constructionLocomotive.equipment_grid = "construction-wagon"
-- constructionLocomotive.minable = { mining_time = 0.5, result = "construction-wagon" }
-- constructionLocomotive.allow_robot_dispatch_in_automatic_mode = true

constructionWagon.name = "construction-cargo-wagon"
constructionWagon.equipment_grid = "construction-wagon"
constructionWagon.minable = { mining_time = 0.5, result = "construction-cargo-wagon" }
constructionWagon.allow_robot_dispatch_in_automatic_mode = true
constructionWagon.icon = "__construction-wagon__/graphics/icons/cargo-wagon.png"
constructionWagon.inventory_size = settings.startup["construction-wagon-wagon-inventory-size"].value

constructionWagon.pictures = {
    rotated =
    {
        layers =
        {
            util.sprite_load("__construction-wagon__/graphics/entity/cargo-wagon/cargo-wagon",
                {
                    dice = 4,
                    priority = "very-low",
                    allow_low_quality_rotation = true,
                    back_equals_front = true,
                    direction_count = 128,
                    scale = 0.5,
                    usage = "train"
                }
            ),
            util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-mask",
                {
                    dice = 4,
                    priority = "very-low",
                    allow_low_quality_rotation = true,
                    back_equals_front = true,
                    flags = { "mask" },
                    apply_runtime_tint = true,
                    tint_as_overlay = true,
                    direction_count = 128,
                    scale = 0.5,
                    usage = "train"
                }
            ),
            util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-shadow",
                {
                    dice = 4,
                    priority = "very-low",
                    allow_low_quality_rotation = true,
                    back_equals_front = true,
                    draw_as_shadow = true,
                    direction_count = 128,
                    scale = 0.5,
                    usage = "train"
                }
            )
        }
    }
}
constructionWagon.horizontal_doors =
{
    layers =
    {
        util.sprite_load("__construction-wagon__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal",
            {
                frame_count = 8,
                scale = 0.5,
                usage = "train"
            }
        ),
        util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-door-horizontal-mask",
            {
                apply_runtime_tint = true,
                tint_as_overlay = true,
                flags = { "mask" },
                frame_count = 8,
                scale = 0.5,
                usage = "train"
            }
        )
    }
}
constructionWagon.vertical_doors =
{
    layers =
    {
        util.sprite_load("__construction-wagon__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical",
            {
                frame_count = 8,
                scale = 0.5,
                usage = "train"
            }
        ),
        util.sprite_load("__base__/graphics/entity/cargo-wagon/cargo-wagon-door-vertical-mask",
            {
                apply_runtime_tint = true,
                tint_as_overlay = true,
                flags = { "mask" },
                frame_count = 8,
                scale = 0.5,
                usage = "train"
            }
        )
    }
}

data.extend({ constructionWagon })

local constructionTrainRoboportEquipment = table.deepcopy(data.raw["roboport-equipment"]["personal-roboport-equipment"])

constructionTrainRoboportEquipment.name = "construction-wagon-roboport-equipment"
constructionTrainRoboportEquipment.take_result = "construction-wagon-roboport"
constructionTrainRoboportEquipment.construction_radius = settings.startup["construction-wagon-roboport-radius"].value
constructionTrainRoboportEquipment.robot_limit = settings.startup["construction-wagon-roboport-robot-limit"].value
constructionTrainRoboportEquipment.charging_station_count = settings.startup["construction-wagon-roboport-charging-station-count"].value
constructionTrainRoboportEquipment.categories = {"construction-wagon-equipment"}
constructionTrainRoboportEquipment.sprite =
{
    filename = "__construction-wagon__/graphics/equipment/construction-wagon-roboport.png",
    width = 128,
    height = 128,
    priority = "medium",
    scale = 0.5
}

data.extend({ constructionTrainRoboportEquipment })

-- local constructionLocomotiveItem = table.deepcopy(data.raw["item-with-entity-data"]["locomotive"])
local constructionWagonItem = table.deepcopy(data.raw["item-with-entity-data"]["cargo-wagon"])
local constructionWagonRoboport = table.deepcopy(data.raw["item"]["personal-roboport-equipment"])

constructionWagonRoboport.name = "construction-wagon-roboport"
constructionWagonRoboport.place_as_equipment_result = "construction-wagon-roboport-equipment"
constructionWagonRoboport.icon = "__construction-wagon__/graphics/icons/construction-wagon-roboport.png"

-- constructionLocomotiveItem.name = "construction-wagon"
-- constructionLocomotiveItem.place_result = "construction-wagon";


constructionWagonItem.name = "construction-cargo-wagon"
constructionWagonItem.place_result = "construction-cargo-wagon";
constructionWagonItem.icon = "__construction-wagon__/graphics/icons/cargo-wagon.png"

data.extend({ constructionWagonItem, constructionWagonRoboport })

-- local constructionLocomotiveRecipe = table.deepcopy(data.raw["recipe"]["locomotive"])
local constructionWagonRecipe = table.deepcopy(data.raw["recipe"]["cargo-wagon"])

-- constructionLocomotiveRecipe.name = "construction-wagon"
-- constructionLocomotiveRecipe.results = {{type="item", name="construction-wagon", amount=1}}


constructionWagonRecipe.name = "construction-cargo-wagon"
constructionWagonRecipe.results = { { type = "item", name = "construction-cargo-wagon", amount = 1 } }


data.extend({ constructionWagonRecipe })

local constructionTrainResearch = table.deepcopy(data.raw["technology"]["railway"])

constructionTrainResearch.name = "construction-wagon"
constructionTrainResearch.effects =
{
    {
        type = "unlock-recipe",
        recipe = "construction-cargo-wagon"
    }
}
constructionTrainResearch.prerequisites = { "railway", "personal-roboport-equipment" }
constructionTrainResearch.icon = "__construction-wagon__/graphics/technology/construction-wagon.png"
constructionTrainResearch.icon_size = 1024

data.extend({ constructionTrainResearch })

local constructionTrainEquipmentCategory = table.deepcopy(data.raw["equipment-category"]["armor"])

constructionTrainEquipmentCategory.name = "construction-wagon-equipment"

print(constructionTrainEquipmentCategory.name)

data.extend({ constructionTrainEquipmentCategory })

