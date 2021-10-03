package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import flash.geom.Point;
   
   public class FurniturePartyBeamerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_443:int = 2;
      
      private static const const_987:int = 15;
      
      private static const const_988:int = 31;
      
      private static const const_1332:int = 2;
      
      private static const const_1331:int = 1;
       
      
      private var var_1114:Array;
      
      private var var_1112:Array;
      
      private var var_1113:Array;
      
      private var var_1115:Array;
      
      private var var_730:Array;
      
      public function FurniturePartyBeamerVisualization()
      {
         this.var_730 = new Array();
         super();
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         var _loc2_:* = null;
         if(this.var_1113 == null)
         {
            this.initItems(param1);
         }
         _loc2_ = getSprite(2);
         if(_loc2_ != null)
         {
            this.var_730[0] = this.getNewPoint(param1,0);
         }
         _loc2_ = getSprite(3);
         if(_loc2_ != null)
         {
            this.var_730[1] = this.getNewPoint(param1,1);
         }
         return super.updateAnimation(param1);
      }
      
      override protected function getSpriteXOffset(param1:int, param2:int, param3:int) : int
      {
         if(param3 == 2 || param3 == 3)
         {
            if(this.var_730.length == 2)
            {
               return this.var_730[param3 - 2].x;
            }
         }
         return super.getSpriteXOffset(param1,param2,param3);
      }
      
      override protected function getSpriteYOffset(param1:int, param2:int, param3:int) : int
      {
         if(param3 == 2 || param3 == 3)
         {
            if(this.var_730.length == 2)
            {
               return this.var_730[param3 - 2].y;
            }
         }
         return super.getSpriteYOffset(param1,param2,param3);
      }
      
      private function getNewPoint(param1:Number, param2:int) : Point
      {
         var _loc7_:int = 0;
         var _loc3_:Number = this.var_1114[param2];
         var _loc4_:int = this.var_1112[param2];
         var _loc5_:int = this.var_1113[param2];
         var _loc6_:Number = this.var_1115[param2];
         if(param1 == 32)
         {
            _loc7_ = const_987;
         }
         else
         {
            _loc7_ = const_988;
         }
         if(Math.abs(_loc3_ + _loc4_ * _loc5_) >= _loc7_)
         {
            _loc4_ = -_loc4_;
            this.var_1112[param2] = _loc4_;
         }
         var _loc8_:Number = (_loc7_ - Math.abs(_loc3_)) * _loc6_;
         var _loc9_:Number = _loc4_ * Math.sin(Math.abs(_loc3_ / 4)) * _loc8_;
         if(_loc4_ > 0)
         {
            _loc9_ -= _loc8_;
         }
         else
         {
            _loc9_ += _loc8_;
         }
         _loc3_ += _loc4_ * _loc5_;
         this.var_1114[param2] = _loc3_;
         if(int(_loc9_) == 0)
         {
            this.var_1115[param2] = this.getRandomAmplitudeFactor();
         }
         return new Point(_loc3_,_loc9_);
      }
      
      private function initItems(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 == 32)
         {
            _loc2_ = const_987;
         }
         else
         {
            _loc2_ = const_988;
         }
         this.var_1114 = new Array();
         this.var_1114.push(Math.random() * _loc2_ * 1.5);
         this.var_1114.push(Math.random() * _loc2_ * 1.5);
         this.var_1112 = new Array();
         this.var_1112.push(1);
         this.var_1112.push(-1);
         this.var_1113 = new Array();
         this.var_1113.push(const_1332);
         this.var_1113.push(const_1331);
         this.var_1115 = new Array();
         this.var_1115.push(this.getRandomAmplitudeFactor());
         this.var_1115.push(this.getRandomAmplitudeFactor());
      }
      
      private function getRandomAmplitudeFactor() : Number
      {
         return Math.random() * 30 / 100 + 0.15;
      }
   }
}
