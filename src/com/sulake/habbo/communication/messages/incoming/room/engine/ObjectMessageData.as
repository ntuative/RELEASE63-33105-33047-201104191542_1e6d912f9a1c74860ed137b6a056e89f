package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_160:Number = 0;
      
      private var var_159:Number = 0;
      
      private var var_428:int = 0;
      
      private var var_482:int = 0;
      
      private var var_582:int = 0;
      
      private var _type:int = 0;
      
      private var var_2963:String = "";
      
      private var var_1593:int = -1;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_2426:int = 0;
      
      private var var_2427:String = null;
      
      private var var_187:Boolean = false;
      
      public function ObjectMessageData(param1:int)
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
      
      public function get sizeX() : int
      {
         return this.var_482;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_187)
         {
            this.var_482 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_582;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_187)
         {
            this.var_582 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_187)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_187)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_187)
         {
            this._data = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return this.var_2427;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!this.var_187)
         {
            this.var_2427 = param1;
         }
      }
      
      public function get extra() : int
      {
         return this.var_1593;
      }
      
      public function set extra(param1:int) : void
      {
         if(!this.var_187)
         {
            this.var_1593 = param1;
         }
      }
      
      public function get expiryTime() : int
      {
         return this.var_2426;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!this.var_187)
         {
            this.var_2426 = param1;
         }
      }
   }
}
