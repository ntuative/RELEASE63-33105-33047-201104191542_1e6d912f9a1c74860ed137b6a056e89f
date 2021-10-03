package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_858:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1224:String = "inventory_effects";
      
      public static const const_1180:String = "inventory_badges";
      
      public static const const_1536:String = "inventory_clothes";
      
      public static const const_1595:String = "inventory_furniture";
       
      
      private var var_2168:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_858);
         this.var_2168 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2168;
      }
   }
}
