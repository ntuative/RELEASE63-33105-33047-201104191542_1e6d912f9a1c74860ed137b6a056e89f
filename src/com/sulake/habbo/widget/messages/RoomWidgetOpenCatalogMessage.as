package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_397:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1227:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1086:String = "RWOCM_PIXELS";
      
      public static const const_1202:String = "RWOCM_CREDITS";
       
      
      private var var_2525:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_397);
         this.var_2525 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2525;
      }
   }
}
