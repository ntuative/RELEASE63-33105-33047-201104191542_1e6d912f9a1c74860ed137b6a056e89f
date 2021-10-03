package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2407:Number = 0.0;
      
      private var var_2406:Number = 0.0;
      
      private var var_2671:Number = 0.0;
      
      private var var_2670:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2407 = param1;
         this.var_2406 = param2;
         this.var_2671 = param3;
         this.var_2670 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2407;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2406;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2671;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2670;
      }
   }
}
