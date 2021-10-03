package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_761:String = "";
      
      public static const const_422:int = 0;
      
      public static const const_583:int = 255;
      
      public static const const_671:Boolean = false;
      
      public static const const_572:int = 0;
      
      public static const const_560:int = 0;
      
      public static const const_369:int = 0;
      
      public static const const_1068:int = 1;
      
      public static const const_1165:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2375:String = "";
      
      private var var_2078:int = 0;
      
      private var var_2551:int = 255;
      
      private var var_2862:Boolean = false;
      
      private var var_2864:int = 0;
      
      private var var_2863:int = 0;
      
      private var var_2865:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2375 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2375;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_2078 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_2078;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2551 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2551;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2862 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2862;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2864 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2864;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2863 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2863;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2865 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2865;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
