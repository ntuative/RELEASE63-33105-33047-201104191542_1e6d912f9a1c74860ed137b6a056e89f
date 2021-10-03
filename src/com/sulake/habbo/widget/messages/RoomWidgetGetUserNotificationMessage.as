package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetUserNotificationMessage extends RoomWidgetMessage
   {
      
      public static const const_1173:String = "RWGSM_GET_NOTIFICATIONS";
       
      
      public function RoomWidgetGetUserNotificationMessage(param1:String = null)
      {
         super(param1 != null ? param1 : const_1173);
      }
   }
}
