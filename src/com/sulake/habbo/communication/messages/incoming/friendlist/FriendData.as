package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_943:int;
      
      private var var_717:Boolean;
      
      private var var_1806:Boolean;
      
      private var var_622:String;
      
      private var var_1599:int;
      
      private var var_1945:String;
      
      private var var_1670:String;
      
      private var var_1668:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_943 = param1.readInteger();
         this.var_717 = param1.readBoolean();
         this.var_1806 = param1.readBoolean();
         this.var_622 = param1.readString();
         this.var_1599 = param1.readInteger();
         this.var_1945 = param1.readString();
         this.var_1670 = param1.readString();
         this.var_1668 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_943;
      }
      
      public function get online() : Boolean
      {
         return this.var_717;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1806;
      }
      
      public function get figure() : String
      {
         return this.var_622;
      }
      
      public function get categoryId() : int
      {
         return this.var_1599;
      }
      
      public function get motto() : String
      {
         return this.var_1945;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1670;
      }
      
      public function get realName() : String
      {
         return this.var_1668;
      }
   }
}
