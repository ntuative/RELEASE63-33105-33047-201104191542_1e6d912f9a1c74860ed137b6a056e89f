package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_2053:int;
      
      private var var_2868:int;
      
      private var var_1423:int;
      
      private var var_2617:int;
      
      private var var_126:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2053 = param1.readInteger();
         this.var_2868 = param1.readInteger();
         this.var_1423 = param1.readInteger();
         this.var_2617 = param1.readInteger();
         this.var_126 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_2053);
      }
      
      public function get callId() : int
      {
         return this.var_2053;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2868;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1423;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2617;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_126;
      }
   }
}
