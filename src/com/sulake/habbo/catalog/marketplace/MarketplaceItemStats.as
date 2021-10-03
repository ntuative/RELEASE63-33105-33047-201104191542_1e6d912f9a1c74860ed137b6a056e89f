package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2187:int;
      
      private var var_2185:int;
      
      private var var_2186:int;
      
      private var _dayOffsets:Array;
      
      private var var_1637:Array;
      
      private var var_1638:Array;
      
      private var var_2184:int;
      
      private var var_2183:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2187;
      }
      
      public function get offerCount() : int
      {
         return this.var_2185;
      }
      
      public function get historyLength() : int
      {
         return this.var_2186;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1637;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1638;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2184;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2183;
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2187 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2185 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2186 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1637 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1638 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2184 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2183 = param1;
      }
   }
}
