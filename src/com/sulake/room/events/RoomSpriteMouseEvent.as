package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1633:String = "";
      
      private var var_1730:String = "";
      
      private var var_2336:String = "";
      
      private var var_2814:Number = 0;
      
      private var var_2811:Number = 0;
      
      private var var_2163:Number = 0;
      
      private var var_2166:Number = 0;
      
      private var var_2813:Boolean = false;
      
      private var var_2815:Boolean = false;
      
      private var var_2810:Boolean = false;
      
      private var var_2812:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1633 = param2;
         this.var_1730 = param3;
         this.var_2336 = param4;
         this.var_2814 = param5;
         this.var_2811 = param6;
         this.var_2163 = param7;
         this.var_2166 = param8;
         this.var_2813 = param9;
         this.var_2815 = param10;
         this.var_2810 = param11;
         this.var_2812 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1633;
      }
      
      public function get canvasId() : String
      {
         return this.var_1730;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2336;
      }
      
      public function get screenX() : Number
      {
         return this.var_2814;
      }
      
      public function get screenY() : Number
      {
         return this.var_2811;
      }
      
      public function get localX() : Number
      {
         return this.var_2163;
      }
      
      public function get localY() : Number
      {
         return this.var_2166;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2813;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2815;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2810;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2812;
      }
   }
}
