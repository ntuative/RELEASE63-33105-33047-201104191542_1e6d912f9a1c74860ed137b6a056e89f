package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1455:Boolean = false;
      
      private var var_1692:int;
      
      private var var_1727:Array;
      
      private var var_757:Array;
      
      private var var_756:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1455 = _loc2_.isWrappingEnabled;
         this.var_1692 = _loc2_.wrappingPrice;
         this.var_1727 = _loc2_.stuffTypes;
         this.var_757 = _loc2_.boxTypes;
         this.var_756 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1455;
      }
      
      public function get price() : int
      {
         return this.var_1692;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1727;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_757;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_756;
      }
   }
}
