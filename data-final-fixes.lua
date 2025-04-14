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
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

local function mergeIngredients(ingredients1, ingredients2)
    local merged = {}
    local indexMap = {} -- Для быстрого поиска ингредиентов по имени и типу
    
    -- Функция для добавления ингредиента в объединенную таблицу
    local function addIngredient(ingredient)
        local key = ingredient.type .. "|" .. ingredient.name
        if indexMap[key] then
            -- Если ингредиент уже есть, увеличиваем amount
            merged[indexMap[key]].amount = merged[indexMap[key]].amount + ingredient.amount
        else
            -- Если ингредиента нет, добавляем его
            table.insert(merged, {
                type = ingredient.type,
                name = ingredient.name,
                amount = ingredient.amount
            })
            indexMap[key] = #merged
        end
    end
    
    -- Добавляем ингредиенты из первой таблицы
    for _, ingredient in ipairs(ingredients1) do
        addIngredient(ingredient)
    end
    
    -- Добавляем ингредиенты из второй таблицы
    for _, ingredient in ipairs(ingredients2) do
        addIngredient(ingredient)
    end
    
    for _, ingredient in ipairs(merged) do
        ingredient.amount = ingredient.amount * 2
    end

    return merged
end

local function mergeUnits(unit1, unit2)
    local merged = {}
    
    -- Выбираем наибольшее значение count
    merged.count = math.max(unit1.count or 0, unit2.count or 0)
    
    -- Выбираем наибольшее значение time
    merged.time = math.max(unit1.time or 0, unit2.time or 0)
    
    -- Объединяем ingredients, выбирая максимальные значения
    merged.ingredients = {}
    local ingredientMap = {}
    
    -- Функция для добавления ингредиентов в карту
    local function addIngredients(ingredients)
        for _, ingredient in ipairs(ingredients) do
            local name = ingredient[1]
            local amount = ingredient[2] or 0
            
            if ingredientMap[name] then
                -- Если ингредиент уже есть, выбираем максимальное количество
                if amount > ingredientMap[name] then
                    ingredientMap[name] = amount
                end
            else
                -- Добавляем новый ингредиент
                ingredientMap[name] = amount
            end
        end
    end
    
    -- Добавляем ингредиенты из обеих таблиц
    addIngredients(unit1.ingredients or {})
    addIngredients(unit2.ingredients or {})
    
    -- Преобразуем карту обратно в таблицу
    for name, amount in pairs(ingredientMap) do
        table.insert(merged.ingredients, {name, amount})
    end
    
    -- Сортируем ингредиенты по имени для единообразия
    table.sort(merged.ingredients, function(a, b) return a[1] < b[1] end)
    
    return merged
end

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

local constuctionWagonIngredients = mergeIngredients(wagonIngredients, personalRoboportIngredients)

data.raw["recipe"]["construction-cargo-wagon"].ingredients = constuctionWagonIngredients

local wagonResearchUnit = table.deepcopy(data.raw["technology"]["railway"].unit)

local personalRoboportResarchUnit = table.deepcopy(data.raw["technology"]["personal-roboport-equipment"].unit)

local constructionTrainResearchUnit = mergeUnits(wagonResearchUnit, personalRoboportResarchUnit)

data.raw["technology"]["construction-wagon"].unit = constructionTrainResearchUnit