package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1745:String;
      
      private var var_2493:int;
      
      private var _password:String;
      
      private var var_1599:int;
      
      private var var_2497:int;
      
      private var var_875:Array;
      
      private var var_2492:Array;
      
      private var var_2499:Boolean;
      
      private var var_2495:Boolean;
      
      private var var_2498:Boolean;
      
      private var var_2494:Boolean;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2499;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2499 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2495;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2495 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2498;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2498 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2494;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2494 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1745;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1745 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2493;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2493 = param1;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1599;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1599 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2497;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2497 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_875;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_875 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2492;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2492 = param1;
      }
   }
}
