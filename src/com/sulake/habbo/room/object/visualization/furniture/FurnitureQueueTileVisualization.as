package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1394:int = 3;
      
      private static const const_1392:int = 2;
      
      private static const const_1390:int = 1;
      
      private static const const_1391:int = 15;
       
      
      private var var_306:Array;
      
      private var var_1169:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_306 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1392)
         {
            this.var_306 = new Array();
            this.var_306.push(const_1390);
            this.var_1169 = const_1391;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1169 > 0)
         {
            --this.var_1169;
         }
         if(this.var_1169 == 0)
         {
            if(this.var_306.length > 0)
            {
               super.setAnimation(this.var_306.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
