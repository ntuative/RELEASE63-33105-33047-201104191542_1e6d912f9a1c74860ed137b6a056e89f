package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_79:HabboNotificationItemStyle;
      
      private var var_179:String;
      
      private var var_22:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         this.var_179 = param1;
         this.var_79 = param2;
         this.var_22 = param3;
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return this.var_79;
      }
      
      public function get content() : String
      {
         return this.var_179;
      }
      
      public function dispose() : void
      {
         this.var_179 = null;
         if(this.var_79 != null)
         {
            this.var_79.dispose();
            this.var_79 = null;
         }
         this.var_22 = null;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_79.componentLinks;
         for each(_loc2_ in _loc1_)
         {
            if(this.var_22 != null)
            {
               this.var_22.onExecuteLink(_loc2_);
            }
         }
      }
   }
}
