-- Convert crating machines from 3x3 to 4x4

local IC_PREFIX = "ic-containerization-"


local item1 = data.raw.item[IC_PREFIX.."machine-1"]
item1.order = "d-a["..IC_PREFIX.."machine-1]"

local recipe1 = data.raw.recipe[IC_PREFIX.."machine-1"]
--[[ Original:
{
  {"assembling-machine-1",1},
  {"electric-engine-unit",1},
  {"stack-inserter",2},
  {"steel-plate",20},
}]]
recipe1.ingredients = {
  {"engine-unit", 2},
  {"fast-inserter", 4},
  {"steel-plate", 5},
}

local technology1 = data.raw.technology[IC_PREFIX.."1"]
-- Original: {"automation", "electric-engine", "stack-inserter"}
technology1.prerequisites = {"engine", "fast-inserter"}
technology1.unit.count = 100

--[[
table.insert(technology1.effects, 2, {
  type = "unlock-recipe",
  recipe = "ff-container",
})
]]

local item2 = data.raw.item[IC_PREFIX.."machine-2"]
item2.order = "d-b["..IC_PREFIX.."machine-2]"

local recipe2 = data.raw.recipe[IC_PREFIX.."machine-2"]
--[[ Original:
  {IC_PREFIX.."machine-1",1},
  {"electric-engine-unit",1},
  {"stack-inserter",2},
  {"steel-plate",30},
]]
recipe2.ingredients = {
  {IC_PREFIX.."machine-1", 1},
  {"electric-engine-unit", 2},
  {"stack-inserter", 2},
  {"steel-plate", 20},
}

local technology2 = data.raw.technology[IC_PREFIX.."2"]
-- Original: {"automation-2", IC_PREFIX.."1"},
technology2.prerequisites = {"electric-engine", "stack-inserter", IC_PREFIX.."1"}
technology2.unit.count = 200


local item3 = data.raw.item[IC_PREFIX.."machine-3"]
item3.order = "d-c["..IC_PREFIX.."machine-3]"

local recipe3 = data.raw.recipe[IC_PREFIX.."machine-3"]
--[[ Original:
  {IC_PREFIX.."machine-2",1},
  {"electric-engine-unit",1},
  {"stack-inserter",2},
  {"steel-plate",50},
]]
recipe3.ingredients = {
  {IC_PREFIX.."machine-2", 1},
  {"electric-engine-unit", 8},
  {"advanced-circuit", 8},
  {"steel-plate", 30},
}

local technology3 = data.raw.technology[IC_PREFIX.."3"]
-- Original: {"automation-3", IC_PREFIX.."2"}
technology3.prerequisites = {"automation-3", IC_PREFIX.."2"}
technology3.unit.count = 300

-- Undo change from DCM
-- table.insert(data.raw["character"]["character"].crafting_categories, "packing")
for i, category in pairs(data.raw["character"]["character"].crafting_categories) do
  if category == "packing" then
    table.remove(data.raw["character"]["character"].crafting_categories, i)
  end
end
