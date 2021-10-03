package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_190;
         param1["bound_to_parent_rect"] = const_101;
         param1["child_window"] = const_1074;
         param1["embedded_controller"] = const_1155;
         param1["resize_to_accommodate_children"] = const_71;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_685;
         param1["mouse_dragging_target"] = const_273;
         param1["mouse_dragging_trigger"] = const_432;
         param1["mouse_scaling_target"] = const_288;
         param1["mouse_scaling_trigger"] = const_606;
         param1["horizontal_mouse_scaling_trigger"] = const_276;
         param1["vertical_mouse_scaling_trigger"] = const_231;
         param1["observe_parent_input_events"] = const_1176;
         param1["optimize_region_to_layout_size"] = const_468;
         param1["parent_window"] = const_1246;
         param1["relative_horizontal_scale_center"] = const_186;
         param1["relative_horizontal_scale_fixed"] = const_153;
         param1["relative_horizontal_scale_move"] = const_370;
         param1["relative_horizontal_scale_strech"] = const_384;
         param1["relative_scale_center"] = const_1083;
         param1["relative_scale_fixed"] = const_746;
         param1["relative_scale_move"] = const_1267;
         param1["relative_scale_strech"] = const_1203;
         param1["relative_vertical_scale_center"] = const_209;
         param1["relative_vertical_scale_fixed"] = const_133;
         param1["relative_vertical_scale_move"] = const_251;
         param1["relative_vertical_scale_strech"] = const_308;
         param1["on_resize_align_left"] = const_914;
         param1["on_resize_align_right"] = const_455;
         param1["on_resize_align_center"] = const_552;
         param1["on_resize_align_top"] = const_682;
         param1["on_resize_align_bottom"] = const_594;
         param1["on_resize_align_middle"] = const_477;
         param1["on_accommodate_align_left"] = const_1185;
         param1["on_accommodate_align_right"] = const_526;
         param1["on_accommodate_align_center"] = const_737;
         param1["on_accommodate_align_top"] = const_1260;
         param1["on_accommodate_align_bottom"] = const_544;
         param1["on_accommodate_align_middle"] = const_852;
         param1["route_input_events_to_parent"] = const_517;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1234;
         param1["scalable_with_mouse"] = const_1131;
         param1["reflect_horizontal_resize_to_parent"] = const_518;
         param1["reflect_vertical_resize_to_parent"] = const_540;
         param1["reflect_resize_to_parent"] = const_350;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1076;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
