-- Snorunt 361
-- Glalie 362
-- Spheal 363
-- Sealeo 364
-- Walrein 365
-- Clamperl 366
-- Huntail 367
-- Gorebyss 368
-- Relicanth 369
-- Luvdisc 370
-- Bagon 371
-- Shelgon 372
-- Salamence 373
-- Beldum 374
local beldum={
  name = "beldum", 
  pos = {x = 5, y = 12},
  config = {extra = {chips = 0, chip_mod = 8, size = 4}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod, center.ability.extra.size}}
  end,
  rarity = 2, 
  cost = 6, 
  stage = "Basic", 
  ptype = "Metal",
  atlas = "Pokedex3",
  perishable_compat = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint then
        local has_ace = false
        for i = 1, #context.scoring_hand do
            if context.scoring_hand[i]:get_id() == 14 then has_ace = true; break end
        end
        if has_ace then
          if context.scoring_name == "Four of a Kind" then
            card.ability.extra.chips = card.ability.extra.chips + 2 * card.ability.extra.chip_mod
          else
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
          end
        end
      end
      if context.joker_main then
        
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips,
        }
      end
    end
    return scaling_evo(self, card, context, "j_poke_metang", card.ability.extra.chips, 64)
  end,
}
-- Metang 375
local metang={
  name = "metang", 
  pos = {x = 6, y = 12},
  config = {extra = {chips = 0, chip_mod = 8, size = 4}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips, center.ability.extra.chip_mod, center.ability.extra.size}}
  end,
  rarity = "poke_safari", 
  cost = 8, 
  stage = "One", 
  ptype = "Metal",
  atlas = "Pokedex3",
  perishable_compat = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.before and not context.blueprint then
        local ace_count = 0
        for i = 1, #context.scoring_hand do
            if context.scoring_hand[i]:get_id() == 14 then ace_count = ace_count + 1 end
        end
        if ace_count > 1 then
          if context.scoring_name == "Four of a Kind" then
            card.ability.extra.chips = card.ability.extra.chips + 4 * card.ability.extra.chip_mod
          else
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod
          end
        end
      end
      if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips,
        }
      end
    end
    return scaling_evo(self, card, context, "j_poke_metagross", card.ability.extra.chips, 256)
  end,
}
-- Metagross 376
local metagross={
  name = "metagross", 
  pos = {x = 7, y = 12},
  config = {extra = {chips = 256,}},
  loc_vars = function(self, info_queue, center)
    type_tooltip(self, info_queue, center)
    return {vars = {center.ability.extra.chips}}
  end,
  rarity = "poke_safari", 
  cost = 10, 
  stage = "Two", 
  ptype = "Metal",
  atlas = "Pokedex3",
  perishable_compat = false,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        return {
          message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}, 
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chips,
        }
      end
    end
    if context.individual and context.cardarea == G.play and not context.end_of_round and context.scoring_name and context.scoring_name == "Four of a Kind" then
      local total_chips = (context.other_card.base.nominal) + (context.other_card.ability.bonus) + (context.other_card.ability.perma_bonus or 0) 
      if context.other_card.edition then
        total_chips = total_chips + (context.other_card.edition.chips or 0)
      end
      local Xmult = (total_chips)^(1/3)
      if Xmult > 0 then
        return {
          message = localize{type = 'variable', key = 'a_xmult', vars = {Xmult}},
          colour = G.C.XMULT,
          mult = card.ability.extra.mult_mod, 
          x_mult = Xmult
        }
      end
    end
  end,
}
-- Regirock 377
-- Regice 378
-- Registeel 379
-- Latias 380
-- Latios 381
-- Kyogre 382
-- Groudon 383
-- Rayquaza 384
-- Jirachi 385
-- Deoxys 386
-- Turtwig 387
-- Grotle 388
-- Torterra 389
-- Chimchar 390
return {name = "Pokemon Jokers 361-390", 
        list = {beldum, metang, metagross},
}