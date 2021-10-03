package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_823:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_620:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_823);
         this.var_620 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_620;
      }
   }
}
