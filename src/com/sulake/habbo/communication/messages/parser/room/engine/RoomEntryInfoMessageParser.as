package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1765:Boolean;
      
      private var var_2392:int;
      
      private var var_419:Boolean;
      
      private var var_1149:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get privateRoom() : Boolean
      {
         return this.var_1765;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2392;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1149;
      }
      
      public function get owner() : Boolean
      {
         return this.var_419;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1149 != null)
         {
            this.var_1149.dispose();
            this.var_1149 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1765 = param1.readBoolean();
         if(this.var_1765)
         {
            this.var_2392 = param1.readInteger();
            this.var_419 = param1.readBoolean();
         }
         else
         {
            this.var_1149 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
