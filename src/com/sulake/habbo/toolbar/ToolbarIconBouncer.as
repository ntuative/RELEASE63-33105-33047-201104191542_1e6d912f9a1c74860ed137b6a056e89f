package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2750:Number;
      
      private var var_1891:Number;
      
      private var var_1024:Number;
      
      private var var_432:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2750 = param1;
         this.var_1891 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_1024 = param1;
         this.var_432 = 0;
      }
      
      public function update() : void
      {
         this.var_1024 += this.var_1891;
         this.var_432 += this.var_1024;
         if(this.var_432 > 0)
         {
            this.var_432 = 0;
            this.var_1024 = this.var_2750 * -1 * this.var_1024;
         }
      }
      
      public function get location() : Number
      {
         return this.var_432;
      }
   }
}
