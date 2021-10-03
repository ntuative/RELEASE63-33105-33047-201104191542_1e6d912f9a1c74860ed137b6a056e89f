package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2454:int;
      
      private var var_2455:int;
      
      private var var_2452:int;
      
      private var var_2453:int;
      
      private var var_104:Array;
      
      private var var_219:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_104 = new Array();
         this.var_219 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2454 = param1.readInteger();
         this.var_2455 = param1.readInteger();
         this.var_2452 = param1.readInteger();
         this.var_2453 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_104.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_219.push(new FriendData(param1));
            _loc4_++;
         }
         return true;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2454;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2455;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2452;
      }
      
      public function get categories() : Array
      {
         return this.var_104;
      }
      
      public function get friends() : Array
      {
         return this.var_219;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2453;
      }
   }
}
