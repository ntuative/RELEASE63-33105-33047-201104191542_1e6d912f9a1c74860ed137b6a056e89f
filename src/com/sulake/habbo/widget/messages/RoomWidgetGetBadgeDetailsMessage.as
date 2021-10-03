package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_775:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_1415:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_775);
         this.var_1415 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1415;
      }
   }
}
