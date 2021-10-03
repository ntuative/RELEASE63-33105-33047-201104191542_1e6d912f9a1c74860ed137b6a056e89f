package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1701:int = 0;
      
      private var var_1700:int = 0;
      
      private var var_2296:int = 0;
      
      private var var_2297:Boolean = false;
      
      private var var_2268:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1701 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1700 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2296 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2297 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2268 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1701;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1700;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2296;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2297;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2268;
      }
   }
}
