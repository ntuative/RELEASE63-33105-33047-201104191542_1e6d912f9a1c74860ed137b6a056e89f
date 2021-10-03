package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_622:String;
      
      private var var_1053:String;
      
      private var var_2176:String;
      
      private var var_1668:String;
      
      private var var_2180:int;
      
      private var var_2177:String;
      
      private var var_2179:int;
      
      private var var_2181:int;
      
      private var var_2182:int;
      
      private var _respectLeft:int;
      
      private var var_819:int;
      
      private var var_2178:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_622 = param1.readString();
         this.var_1053 = param1.readString();
         this.var_2176 = param1.readString();
         this.var_1668 = param1.readString();
         this.var_2180 = param1.readInteger();
         this.var_2177 = param1.readString();
         this.var_2179 = param1.readInteger();
         this.var_2181 = param1.readInteger();
         this.var_2182 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_819 = param1.readInteger();
         this.var_2178 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_622;
      }
      
      public function get sex() : String
      {
         return this.var_1053;
      }
      
      public function get customData() : String
      {
         return this.var_2176;
      }
      
      public function get realName() : String
      {
         return this.var_1668;
      }
      
      public function get tickets() : int
      {
         return this.var_2180;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2177;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2179;
      }
      
      public function get directMail() : int
      {
         return this.var_2181;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2182;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_819;
      }
      
      public function get identityId() : int
      {
         return this.var_2178;
      }
   }
}
