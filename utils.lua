
function mergeIngredients(ingredients1, ingredients2)
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

    return merged
end

function doubleIngredients(ingredients)
    if not ingredients then
        return {}
    end

    local doubledIngredients = table.deepcopy(ingredients)

    for _, ingredient in ipairs(doubledIngredients) do
        ingredient.amount = ingredient.amount * 2
    end

    return doubledIngredients
end

function mergeUnits(unit1, unit2)
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