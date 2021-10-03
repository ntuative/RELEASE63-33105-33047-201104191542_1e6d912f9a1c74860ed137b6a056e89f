package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserRightsMessageParser implements IMessageParser
   {
       
      
      private var var_2282:int;
      
      private var _securityLevel:int;
      
      public function UserRightsMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2282 = param1.readInteger();
         this._securityLevel = param1.readInteger();
         return true;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2282;
      }
      
      public function get securityLevel() : int
      {
         return this._securityLevel;
      }
   }
}
