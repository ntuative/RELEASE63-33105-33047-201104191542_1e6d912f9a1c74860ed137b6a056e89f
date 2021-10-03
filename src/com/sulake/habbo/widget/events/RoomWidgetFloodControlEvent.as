package com.sulake.habbo.widget.events
{
   public class RoomWidgetFloodControlEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_423:String = "RWFCE_FLOOD_CONTROL";
       
      
      private var var_2062:int = 0;
      
      public function RoomWidgetFloodControlEvent(param1:int)
      {
         super(const_423,false,false);
         this.var_2062 = param1;
      }
      
      public function get seconds() : int
      {
         return this.var_2062;
      }
   }
}
