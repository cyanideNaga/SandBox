/// @description  inventory_draw(x,y, spritebox, sprite_infobox, slot_gap, text_color)
/// @param x
/// @param y
/// @param  spritebox
/// @param  sprite_infobox
/// @param  slot_gap
/// @param  text_color
var _x, _y, slot_width, spritebox, sprite_infobox,slot_gap,pre_col;


//create slider



_x = argument0;
_y = argument1+yy;
var sy= argument1;
spritebox = argument2;
sprite_infobox = argument3;
slot_gap = argument4;
pre_col = draw_get_color();
draw_set_color(argument5);

draw_set_font(f_menu);

var slot_height;
slot_width = slot
slot_height = slot_h//slot/slot_width
var j, index;
j = 0
index = 0
var item_id_va;
item_id_va = -1
var sprite;
sprite = spr_ItemIcon_Default
var spr_width, spr_height;
spr_width = sprite_get_width(spritebox)
spr_height = sprite_get_height(spritebox)

if a>=0.1 {

if yy!=0 && mouse_wheel_up() yy+=32;
if yy!=-32*18 && mouse_wheel_down() yy-=32;


for (i=0; i<slot_height; i+=1)
{
    for (j=0; j<slot_width; j+=1)
    {
        if global.ItemLastSelect = index{
           draw_sprite(spritebox,2,_x+((spr_width+slot_gap)*j),_y+((spr_height+slot_gap)*i))
        }else{
        if index = global.ItemSelected{
           if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),_x+((spr_width+slot_gap)*j),_y+((spr_height+slot_gap)*i),_x+((spr_width+slot_gap)*j)+spr_width,_y+((spr_height+slot_gap)*i)+spr_height){
              if mouse_check_button_pressed(mb_left){
                 global.ItemLastSelect = global.ItemSelected
              }
                 draw_sprite(spritebox,1,_x+((spr_width+slot_gap)*j),_y+((spr_height+slot_gap)*i))
           }else{
              draw_sprite(spritebox,0,_x+((spr_width+slot_gap)*j),_y+((spr_height+slot_gap)*i))
           }
        }else{
           draw_sprite(spritebox,0,_x+((spr_width+slot_gap)*j),_y+((spr_height+slot_gap)*i))
        }
        }
        index += 1
    }
}
index = 0
global.MouseOutside = true
for (i=0; i<slot_height; i+=1)
{
    for (j=0; j<slot_width; j+=1)
    {
           if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),_x+((spr_width+slot_gap)*j),_y+((spr_height+slot_gap)*i),_x+((spr_width+slot_gap)*j)+spr_width,_y+((spr_height+slot_gap)*i)+spr_height){
              global.ItemSelected = index
              global.MouseOutside = false
              if mouse_check_button(mb_right){
                 if !global.MouseItem{
                    global.MouseIndex = index //what item is moved
                    global.MouseItem = true //moving item 
                 }
                 global.ItemLastSelect = -1
              }else if mouse_check_button_released(mb_right){
                 if global.MouseItem{
                    inventory_item_exchange(global.MouseIndex,index)
                    global.MouseItem = false
                    global.MouseIndex = -1
                    global.ItemLastSelect = -1
                 }
              }
           }
        //
        if ds_map_find_value(global.inventory,"slot"+string(index)) = true{
           item_id_va = ds_map_find_value(global.inventory,"ID"+string(index))
           sprite = ds_map_find_value(global.item_id,"item["+string(item_id_va)+",2]")
           var item_width, item_height;
           item_width = sprite_get_width(sprite)
           item_height = sprite_get_height(sprite)
           
           if global.MouseItem = false{
              draw_sprite(sprite,image_index,_x+((spr_width+slot_gap)*j)+(spr_width/2)-(item_width/2),_y+((spr_height+slot_gap)*i)+(spr_height/2)-(item_height/2))
              draw_text(_x+((spr_width+slot_gap)*j)+((spr_width+slot_gap)/2),_y+((spr_height+slot_gap)*i)+((spr_height+slot_gap)/2),string_hash_to_newline(string(ds_map_find_value(global.inventory,"Stack"+string(index)))))
           }else{
              if global.MouseIndex != index{
                 draw_sprite(sprite,image_index,_x+((spr_width+slot_gap)*j)+(spr_width/2)-(item_width/2),_y+((spr_height+slot_gap)*i)+(spr_height/2)-(item_height/2))
                 draw_text(_x+((spr_width+slot_gap)*j)+((spr_width+slot_gap)/2),_y+((spr_height+slot_gap)*i)+((spr_height+slot_gap)/2),string_hash_to_newline(string(ds_map_find_value(global.inventory,"Stack"+string(index)))))
              }else{
                 draw_sprite(sprite,image_index,device_mouse_x_to_gui(0)-(item_width/2),device_mouse_y_to_gui(0)-(item_height/2)) 
              }
           }
        }
        index += 1
    };  
};
index = 0
for (i=0; i<slot_height; i+=1)
{
    for (j=0; j<slot_width; j+=1)
    {
    if ds_map_find_value(global.inventory,"slot"+string(index)) = true{
      if global.MouseItem = false{
      if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),_x+((spr_width+slot_gap)*j),_y+((spr_height+slot_gap)*i),_x+((spr_width+slot_gap)*j)+spr_width,_y+((spr_height+slot_gap)*i)+spr_height){
         draw_panel(sprite_infobox,0,max(__view_get( e__VW.XView, 0 ),device_mouse_x_to_gui(0)-string_width(string_hash_to_newline(string(item_id_read(inventory_read("ID",index),0))))/2),floor(_y+((spr_height+slot_gap)*i)-5-string_height(string_hash_to_newline(string(item_id_read(inventory_read("ID",index),0))))/2-15),string_width(string_hash_to_newline(string(item_id_read(inventory_read("ID",index),0))))+10,string_height(string_hash_to_newline(string(item_id_read(inventory_read("ID",index),0))))+10,10)
         draw_text(max(__view_get( e__VW.XView, 0 )+5,device_mouse_x_to_gui(0)+5+-string_width(string_hash_to_newline(string(item_id_read(inventory_read("ID",index),0))))/2),floor(_y+((spr_height+slot_gap)*i)-string_height(string_hash_to_newline(string(item_id_read(inventory_read("ID",index),0))))/2-15),string_hash_to_newline(string(item_id_read(inventory_read("ID",index),0))))
      }
      }
    }
    index += 1
    };
};
if inv==inv.open{
//drop 1
var r = ds_map_find_value(global.inventory,"Stack"+string(global.MouseIndex));
if mouse_check_button(mb_left) && r>0{
   if global.MouseOutside{
      if global.MouseIndex!=undefined  
      with (instance_create(mouse_x,mouse_y,obj_drop)){
           vx=random_range(-1,1)
           vy=random_range(-1,1)
           ID=ds_map_find_value(global.inventory,"ID"+string(global.MouseIndex))
         }
         inventory_item_delete(global.MouseIndex,1)

   }
}
//Drop all
if mouse_check_button_released(mb_right){
   if global.MouseOutside{
      if global.MouseIndex!=undefined
      var r = ds_map_find_value(global.inventory,"Stack"+string(global.MouseIndex));
      repeat(r)   
      with (instance_create(mouse_x,mouse_y,obj_drop)){
           vx=random_range(-1,1)
           vy=random_range(-1,1)
           ID=ds_map_find_value(global.inventory,"ID"+string(global.MouseIndex))
         }
         inventory_item_delete(global.MouseIndex,r)
      global.MouseIndex = -1
      global.MouseItem = false
   }
}
if r==0 {
      global.MouseIndex = -1
      global.MouseItem = false
      }
}

draw_panel(spr_slot,1,_x+10+42*slot_width,sy,10,43*7,5)
var py= sy-(yy/32*16)
draw_panel(spr_slot,2,_x+5+42*slot_width,py,20,20,10)




}      
draw_set_color(pre_col);

     // show_debug_message("I Last selected "+string(global.ItemLastSelect))
     //      show_debug_message("I Mouse outside "+string(global.MouseOutside))
           //show_debug_message("I Mouse slot      "+string(global.MouseIndex))
           //show_debug_message("I Amount         "+string(ds_map_find_value(global.inventory,"Stack"+string(global.MouseIndex))))
