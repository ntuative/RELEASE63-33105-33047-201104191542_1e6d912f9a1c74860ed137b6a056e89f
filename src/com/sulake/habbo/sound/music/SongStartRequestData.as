package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1928:int;
      
      private var var_1989:Number;
      
      private var var_2756:Number;
      
      private var var_2754:int;
      
      private var var_2755:Number;
      
      private var var_2757:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1928 = param1;
         this.var_1989 = param2;
         this.var_2756 = param3;
         this.var_2755 = param4;
         this.var_2757 = param5;
         this.var_2754 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1928;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1989 < 0)
         {
            return 0;
         }
         return this.var_1989 + (getTimer() - this.var_2754) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2756;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2755;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2757;
      }
   }
}
