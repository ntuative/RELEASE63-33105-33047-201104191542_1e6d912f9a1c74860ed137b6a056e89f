package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_881;
         param1["bitmap"] = const_875;
         param1["border"] = const_946;
         param1["border_notify"] = const_1779;
         param1["button"] = const_603;
         param1["button_thick"] = const_947;
         param1["button_icon"] = const_1711;
         param1["button_group_left"] = const_849;
         param1["button_group_center"] = const_922;
         param1["button_group_right"] = const_698;
         param1["canvas"] = const_862;
         param1["checkbox"] = const_909;
         param1["closebutton"] = const_1137;
         param1["container"] = const_396;
         param1["container_button"] = const_713;
         param1["display_object_wrapper"] = const_949;
         param1["dropmenu"] = const_619;
         param1["dropmenu_item"] = const_539;
         param1["frame"] = const_427;
         param1["frame_notify"] = const_1634;
         param1["header"] = const_683;
         param1["html"] = const_1196;
         param1["icon"] = const_1109;
         param1["itemgrid"] = const_1190;
         param1["itemgrid_horizontal"] = const_475;
         param1["itemgrid_vertical"] = const_806;
         param1["itemlist"] = const_1167;
         param1["itemlist_horizontal"] = const_421;
         param1["itemlist_vertical"] = const_426;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1618;
         param1["menu"] = const_1557;
         param1["menu_item"] = const_1506;
         param1["submenu"] = const_1145;
         param1["minimizebox"] = const_1535;
         param1["notify"] = const_1783;
         param1["null"] = const_961;
         param1["password"] = const_837;
         param1["radiobutton"] = const_797;
         param1["region"] = const_478;
         param1["restorebox"] = const_1569;
         param1["scaler"] = const_508;
         param1["scaler_horizontal"] = const_1736;
         param1["scaler_vertical"] = const_1550;
         param1["scrollbar_horizontal"] = const_553;
         param1["scrollbar_vertical"] = const_749;
         param1["scrollbar_slider_button_up"] = const_1214;
         param1["scrollbar_slider_button_down"] = const_1157;
         param1["scrollbar_slider_button_left"] = const_1240;
         param1["scrollbar_slider_button_right"] = const_1249;
         param1["scrollbar_slider_bar_horizontal"] = const_1093;
         param1["scrollbar_slider_bar_vertical"] = const_1130;
         param1["scrollbar_slider_track_horizontal"] = const_1134;
         param1["scrollbar_slider_track_vertical"] = const_1262;
         param1["scrollable_itemlist"] = const_1591;
         param1["scrollable_itemlist_vertical"] = const_537;
         param1["scrollable_itemlist_horizontal"] = const_1066;
         param1["selector"] = const_907;
         param1["selector_list"] = const_768;
         param1["submenu"] = const_1145;
         param1["tab_button"] = const_910;
         param1["tab_container_button"] = const_1121;
         param1["tab_context"] = const_367;
         param1["tab_content"] = const_1081;
         param1["tab_selector"] = const_795;
         param1["text"] = const_578;
         param1["input"] = const_844;
         param1["toolbar"] = const_1698;
         param1["tooltip"] = const_430;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
