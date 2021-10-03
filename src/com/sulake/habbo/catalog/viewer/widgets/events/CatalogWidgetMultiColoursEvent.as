package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetMultiColoursEvent extends Event
   {
       
      
      private var var_1028:Array;
      
      private var var_2447:String;
      
      private var var_2449:String;
      
      private var var_2448:String;
      
      public function CatalogWidgetMultiColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_MULTI_COLOUR_ARRAY,param5,param6);
         this.var_1028 = param1;
         this.var_2447 = param2;
         this.var_2449 = param3;
         this.var_2448 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_1028;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2447;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2449;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2448;
      }
   }
}
