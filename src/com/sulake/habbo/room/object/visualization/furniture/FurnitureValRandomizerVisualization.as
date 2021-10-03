package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1018:int = 20;
      
      private static const const_657:int = 10;
      
      private static const const_1393:int = 31;
      
      private static const const_1394:int = 32;
      
      private static const const_656:int = 30;
       
      
      private var var_306:Array;
      
      private var var_763:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_306 = new Array();
         super();
         super.setAnimation(const_656);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_763)
            {
               this.var_763 = true;
               this.var_306 = new Array();
               this.var_306.push(const_1393);
               this.var_306.push(const_1394);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_657)
         {
            if(this.var_763)
            {
               this.var_763 = false;
               this.var_306 = new Array();
               if(direction == 2)
               {
                  this.var_306.push(const_1018 + 5 - param1);
                  this.var_306.push(const_657 + 5 - param1);
               }
               else
               {
                  this.var_306.push(const_1018 + param1);
                  this.var_306.push(const_657 + param1);
               }
               this.var_306.push(const_656);
               return;
            }
            super.setAnimation(const_656);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
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
