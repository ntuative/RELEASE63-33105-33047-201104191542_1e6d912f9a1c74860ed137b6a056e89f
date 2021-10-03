package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2362:int;
      
      private var var_2361:int;
      
      private var var_2360:int;
      
      private var var_2359:String;
      
      private var var_1689:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2362 = param1.readInteger();
         this.var_2361 = param1.readInteger();
         this.var_2360 = param1.readInteger();
         this.var_2359 = param1.readString();
         this.var_1689 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2362;
      }
      
      public function get minute() : int
      {
         return this.var_2361;
      }
      
      public function get chatterId() : int
      {
         return this.var_2360;
      }
      
      public function get chatterName() : String
      {
         return this.var_2359;
      }
      
      public function get msg() : String
      {
         return this.var_1689;
      }
   }
}
