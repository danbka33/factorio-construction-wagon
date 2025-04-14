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
        type = "int-setting",
        name = "construction-wagon-roboport-radius",
        setting_type = "startup",
        default_value = 75,
        minimum_value = 15,
        maximum_value = 300,
        order = "a[trains]-a",
    },
    {
        type = "int-setting",
        name = "construction-wagon-wagon-inventory-size",
        setting_type = "startup",
        default_value = 40,
        minimum_value = 40,
        maximum_value = 1000,
        order = "a[trains]-d",
    },
    {
        type = "int-setting",
        name = "construction-wagon-roboport-robot-limit",
        setting_type = "startup",
        default_value = 10,
        minimum_value = 10,
        maximum_value = 100,
        order = "a[trains]-b",
    },
    {
        type = "int-setting",
        name = "construction-wagon-roboport-charging-station-count",
        setting_type = "startup",
        default_value = 2,
        minimum_value = 2,
        maximum_value = 50,
        order = "a[trains]-c",
    },
    {
        type = "int-setting",
        name = "construction-wagon-wagon-grid-height",
        setting_type = "startup",
        default_value = 12,
        minimum_value = 1,
        maximum_value = 50,
        order = "a[trains]-e",
    },
    {
        type = "int-setting",
        name = "construction-wagon-wagon-grid-width",
        setting_type = "startup",
        default_value = 12,
        minimum_value = 1,
        maximum_value = 50,
        order = "a[trains]-f",
    },
})
