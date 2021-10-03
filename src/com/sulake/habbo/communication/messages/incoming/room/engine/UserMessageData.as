package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1253:String = "M";
      
      public static const const_1576:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_160:Number = 0;
      
      private var var_159:Number = 0;
      
      private var var_428:int = 0;
      
      private var _name:String = "";
      
      private var var_2334:int = 0;
      
      private var var_1053:String = "";
      
      private var var_622:String = "";
      
      private var var_2654:String = "";
      
      private var var_2197:int;
      
      private var var_2655:int = 0;
      
      private var var_2657:String = "";
      
      private var var_2656:int = 0;
      
      private var var_2658:int = 0;
      
      private var var_2653:String = "";
      
      private var var_187:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_187 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_187)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_160;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_187)
         {
            this.var_160 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_159;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_187)
         {
            this.var_159 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_428;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_187)
         {
            this.var_428 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_187)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_2334;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_187)
         {
            this.var_2334 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_1053;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_187)
         {
            this.var_1053 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_622;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_187)
         {
            this.var_622 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2654;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_187)
         {
            this.var_2654 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2197;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_187)
         {
            this.var_2197 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2655;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_187)
         {
            this.var_2655 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2657;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_187)
         {
            this.var_2657 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2656;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_187)
         {
            this.var_2656 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2658;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_187)
         {
            this.var_2658 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2653;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_187)
         {
            this.var_2653 = param1;
         }
      }
   }
}
