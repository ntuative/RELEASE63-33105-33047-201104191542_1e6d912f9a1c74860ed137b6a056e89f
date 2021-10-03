package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_902:int = 1;
      
      public static const const_825:int = 2;
      
      public static const const_741:int = 3;
      
      public static const const_1171:int = 4;
      
      public static const const_816:int = 5;
      
      public static const const_1254:int = 6;
       
      
      private var _type:int;
      
      private var var_1111:int;
      
      private var var_2144:String;
      
      private var var_2522:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1111 = param2;
         this.var_2144 = param3;
         this.var_2522 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2144;
      }
      
      public function get time() : String
      {
         return this.var_2522;
      }
      
      public function get senderId() : int
      {
         return this.var_1111;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
