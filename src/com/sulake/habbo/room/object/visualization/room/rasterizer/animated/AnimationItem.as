package com.sulake.habbo.room.object.visualization.room.rasterizer.animated
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AnimationItem
   {
       
      
      private var _x:Number = 0.0;
      
      private var var_160:Number = 0.0;
      
      private var var_1500:Number = 0.0;
      
      private var var_1499:Number = 0.0;
      
      private var _bitmapData:BitmapData = null;
      
      public function AnimationItem(param1:Number, param2:Number, param3:Number, param4:Number, param5:BitmapData)
      {
         super();
         this._x = param1;
         this.var_160 = param2;
         this.var_1500 = param3;
         this.var_1499 = param4;
         if(isNaN(this._x))
         {
            this._x = 0;
         }
         if(isNaN(this.var_160))
         {
            this.var_160 = 0;
         }
         if(isNaN(this.var_1500))
         {
            this.var_1500 = 0;
         }
         if(isNaN(this.var_1499))
         {
            this.var_1499 = 0;
         }
         this._bitmapData = param5;
      }
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      public function dispose() : void
      {
         this._bitmapData = null;
      }
      
      public function getPosition(param1:int, param2:int, param3:Number, param4:Number, param5:int) : Point
      {
         var _loc6_:Number = this._x;
         var _loc7_:Number = this.var_160;
         if(param3 > 0)
         {
            _loc6_ += this.var_1500 / param3 * param5 / 1000;
         }
         if(param4 > 0)
         {
            _loc7_ += this.var_1499 / param4 * param5 / 1000;
         }
         var _loc8_:int = _loc6_ % 1 * param1;
         var _loc9_:int = _loc7_ % 1 * param2;
         return new Point(_loc8_,_loc9_);
      }
   }
}
