package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1954:int;
      
      private var var_2463:String;
      
      private var var_1398:int;
      
      private var var_1260:int;
      
      private var var_1744:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1954 = param1.readInteger();
         this.var_2463 = param1.readString();
         this.var_1398 = param1.readInteger();
         this.var_1260 = param1.readInteger();
         this.var_1744 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1954;
      }
      
      public function get petName() : String
      {
         return this.var_2463;
      }
      
      public function get level() : int
      {
         return this.var_1398;
      }
      
      public function get petType() : int
      {
         return this.var_1260;
      }
      
      public function get breed() : int
      {
         return this.var_1744;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
