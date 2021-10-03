package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserChangeMessageParser implements IMessageParser
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var _id:int;
      
      private var var_622:String;
      
      private var var_1053:String;
      
      private var var_2065:String;
      
      private var var_2197:int;
      
      public function UserChangeMessageParser()
      {
         super();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get figure() : String
      {
         return this.var_622;
      }
      
      public function get sex() : String
      {
         return this.var_1053;
      }
      
      public function get customInfo() : String
      {
         return this.var_2065;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2197;
      }
      
      public function flush() : Boolean
      {
         this._id = 0;
         this.var_622 = "";
         this.var_1053 = "";
         this.var_2065 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = param1.readInteger();
         this.var_622 = param1.readString();
         this.var_1053 = param1.readString();
         this.var_2065 = param1.readString();
         this.var_2197 = param1.readInteger();
         if(this.var_1053)
         {
            this.var_1053 = this.var_1053.toUpperCase();
         }
         return true;
      }
   }
}
