package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_943:int;
      
      private var var_717:Boolean;
      
      private var var_2017:Boolean;
      
      private var var_622:String;
      
      private var var_1599:int;
      
      private var var_1945:String;
      
      private var var_1670:String;
      
      private var var_1668:String;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1668 = param3;
         this.var_1945 = param4;
         this.var_943 = param5;
         this.var_717 = param6;
         this.var_2017 = param7;
         this.var_622 = param8;
         this.var_1599 = param9;
         this.var_1670 = param10;
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
      
      public function get allowFollow() : Boolean
      {
         return this.var_2017;
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
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_943 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_717 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_2017 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_622 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1599 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1945 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1670 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1668 = param1;
      }
   }
}
