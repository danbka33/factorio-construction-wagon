-- Construction wagon
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
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

require("utils")

for k, item in pairs(data.raw["battery-equipment"]) do
    local categories = table.deepcopy(item.categories)

    if categories then
        table.insert(categories, "construction-wagon-equipment")
    end
    item.categories = categories
end

for k, item in pairs(data.raw["generator-equipment"]) do
    local categories = table.deepcopy(item.categories)

    if categories then
        table.insert(categories, "construction-wagon-equipment")
    end
    item.categories = categories
end

-- for k, item in pairs(data.raw["inventory-bonus-equipment"]) do
--     local categories = table.deepcopy(item.categories)

--     table.insert(categories, "construction-wagon-equipment")

--     item.categories = categories
-- end

for k, item in pairs(data.raw["roboport-equipment"]) do
    local categories = table.deepcopy(item.categories)
    if categories then
        table.insert(categories, "construction-wagon-equipment")
    end
    item.categories = categories
end

for k, item in pairs(data.raw["solar-panel-equipment"]) do
    local categories = table.deepcopy(item.categories)

    if categories then
        table.insert(categories, "construction-wagon-equipment")
    end

    item.categories = categories
end


local wagonIngredients = table.deepcopy(data.raw["recipe"]["cargo-wagon"].ingredients)

local personalRoboportIngredients = table.deepcopy(data.raw["recipe"]["personal-roboport-equipment"].ingredients)

local constuctionWagonIngredients = doubleIngredients(mergeIngredients(wagonIngredients, personalRoboportIngredients))

data.raw["recipe"]["construction-cargo-wagon"].ingredients = constuctionWagonIngredients

data.raw["recipe"]["construction-wagon-roboport"].ingredients = doubleIngredients(personalRoboportIngredients)

local wagonResearchUnit = table.deepcopy(data.raw["technology"]["railway"].unit)

local personalRoboportResarchUnit = table.deepcopy(data.raw["technology"]["personal-roboport-equipment"].unit)

local constructionTrainResearchUnit = mergeUnits(wagonResearchUnit, personalRoboportResarchUnit)

data.raw["technology"]["construction-wagon"].unit = constructionTrainResearchUnit

require("mod-data-final-fixes")