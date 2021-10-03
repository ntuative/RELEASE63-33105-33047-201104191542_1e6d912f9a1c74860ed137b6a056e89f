package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomThumbnailUpdateResultMessageParser implements IMessageParser
   {
       
      
      private var var_353:int;
      
      private var var_2023:int;
      
      public function RoomThumbnailUpdateResultMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_353 = param1.readInteger();
         this.var_2023 = param1.readInteger();
         return true;
      }
      
      public function get flatId() : int
      {
         return this.var_353;
      }
      
      public function get resultCode() : int
      {
         return this.var_2023;
      }
   }
}
