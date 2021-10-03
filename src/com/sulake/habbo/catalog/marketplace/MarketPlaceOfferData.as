package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2253:int;
      
      private var var_2125:String;
      
      private var var_1692:int;
      
      private var var_2187:int;
      
      private var var_2254:int;
      
      private var var_400:int;
      
      private var var_2255:int = -1;
      
      private var var_1691:int;
      
      private var var_49:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2253 = param3;
         this.var_2125 = param4;
         this.var_1692 = param5;
         this.var_400 = param6;
         this.var_2187 = param7;
         this.var_1691 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_49)
         {
            this.var_49.dispose();
            this.var_49 = null;
         }
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2253;
      }
      
      public function get stuffData() : String
      {
         return this.var_2125;
      }
      
      public function get price() : int
      {
         return this.var_1692;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2187;
      }
      
      public function get image() : BitmapData
      {
         return this.var_49;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_49 != null)
         {
            this.var_49.dispose();
         }
         this.var_49 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2254 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2254;
      }
      
      public function get status() : int
      {
         return this.var_400;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2255;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2255 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1692 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_1691;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1691 = param1;
      }
   }
}
