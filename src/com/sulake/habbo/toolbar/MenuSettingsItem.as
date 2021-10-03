package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2293:String;
      
      private var var_2292:Array;
      
      private var var_2290:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2293 = param1;
         this.var_2292 = param2;
         this.var_2290 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2293;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2292;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2290;
      }
   }
}
