research = {}
research.lasttechnologyviewed = ""
research.technologies = {}
research.technologystodo = {}
research.technologiescompleted = {}

dofile()

-- formspec
function research.show(name)
    minetest.show_formspec(name, "research:research", research.generate_form())
end

function research.showk(keys, old_keys, dtime, name)
    minetest.show_formspec(name, "research:research", research.generate_form())
end

-- generate form
function research.generate_form()

    local form = research.rawform()
    return form
end

function research.rawform(labelRName_label, ImageLargeResearch_image, labelCostDetails_label, labelEffectsDescription_label, tableListTechnologies_col_1_items, tableListTechnologies_col_2_items, tableListTechnologies_col_3_items)
-- Main Display Research Name, Image for Main Display, Main Display Cost Details, Main Display Effects Description, Technology List Image, Technology List Name, Technology List Research Cost Image
    local function table_item_str(cells)
        local most_items = 0
        for i, v in pairs(cells) do
            if #v > most_items then
                most_items = #v
            end
        end
        local cell_str = ""
        for i=1, most_items do
            for n=1, #cells do
                if n > 1 or i > 1 then cell_str = cell_str.."," end
                local item = cells[n][i]
                if item == nil then item = "" end
                cell_str = cell_str..minetest.formspec_escape(item)
            end
        end
        return cell_str
    end

    local tableListTechnologies_cells = {
        [1]=tableListTechnologies_col_1_items,
        [2]=tableListTechnologies_col_2_items,
        [3]=tableListTechnologies_col_3_items,
    }
    local tableListTechnologies_cell_str = table_item_str(tableListTechnologies_cells)

    local form = "" ..
    "size[4.5,10]" ..
    "bgcolor[#41444B;false]" ..
    "label[0.1,0;Research Details:]" ..
    "label[1.4,0;"..minetest.formspec_escape(labelRName_label).."]" ..
    "image_button[0.2,0.5;1.6,2.3;"..ImageLargeResearch_image..";ImageLargeResearch;]" ..
    "box[0.1,0.4;4.3,2.4;#52575D]" ..
    "label[1.7,0.4;Cost: ]" ..
    "label[2.1,0.4;"..minetest.formspec_escape(labelCostDetails_label).."]" ..
    "box[1.7,0.7;2.6,0.6;#FDDB3A]" ..
    "label[1.7,1.3;Effects]" ..
    "box[1.7,1.6;2.6,0.7;#FDDB3A]" ..
    "label[1.7,2.2;"..minetest.formspec_escape(labelEffectsDescription_label).."]" ..
    "box[0.1,3.1;4.3,6.8;#52575D]" ..
    "label[0.1,2.7;Technology List]" ..
    "tablecolumns[image;text;image]" ..
    "table[0.2,3.2;4.1,6.6;tableListTechnologies;"..tableListTechnologies_cell_str..";]" ..
    "label[0.1,0;Research Details:]" ..
    ""
    return form
end

-- callbacks
minetest.register_chatcommand("research", {
    func = function(name)
        research.show(name)
    end
})

