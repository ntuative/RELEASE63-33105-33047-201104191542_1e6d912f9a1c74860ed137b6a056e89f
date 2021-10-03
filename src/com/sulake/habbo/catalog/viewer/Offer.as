package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1689:String = "pricing_model_unknown";
      
      public static const const_406:String = "pricing_model_single";
      
      public static const const_393:String = "pricing_model_multi";
      
      public static const const_513:String = "pricing_model_bundle";
      
      public static const const_1681:String = "price_type_none";
      
      public static const const_781:String = "price_type_credits";
      
      public static const const_1119:String = "price_type_activitypoints";
      
      public static const const_1159:String = "price_type_credits_and_activitypoints";
       
      
      private var var_755:String;
      
      private var var_1142:String;
      
      private var _offerId:int;
      
      private var var_1756:String;
      
      private var var_1144:int;
      
      private var var_1143:int;
      
      private var var_1755:int;
      
      private var var_346:ICatalogPage;
      
      private var var_611:IProductContainer;
      
      private var var_2374:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Array, param7:ICatalogPage)
      {
         super();
         this._offerId = param1;
         this.var_1756 = param2;
         this.var_1144 = param3;
         this.var_1143 = param4;
         this.var_1755 = param5;
         this.var_346 = param7;
         this.analyzePricingModel(param6);
         this.analyzePriceType();
         this.createProductContainer(param6);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_346;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1756;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1144;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1143;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1755;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_611;
      }
      
      public function get pricingModel() : String
      {
         return this.var_755;
      }
      
      public function get priceType() : String
      {
         return this.var_1142;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2374;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2374 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1756 = "";
         this.var_1144 = 0;
         this.var_1143 = 0;
         this.var_1755 = 0;
         this.var_346 = null;
         if(this.var_611 != null)
         {
            this.var_611.dispose();
            this.var_611 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_755)
         {
            case const_406:
               this.var_611 = new SingleProductContainer(this,param1);
               break;
            case const_393:
               this.var_611 = new MultiProductContainer(this,param1);
               break;
            case const_513:
               this.var_611 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_755);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_755 = const_406;
            }
            else
            {
               this.var_755 = const_393;
            }
         }
         else if(param1.length > 1)
         {
            this.var_755 = const_513;
         }
         else
         {
            this.var_755 = const_1689;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1144 > 0 && this.var_1143 > 0)
         {
            this.var_1142 = const_1159;
         }
         else if(this.var_1144 > 0)
         {
            this.var_1142 = const_781;
         }
         else if(this.var_1143 > 0)
         {
            this.var_1142 = const_1119;
         }
         else
         {
            this.var_1142 = const_1681;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_346.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_611.products)
         {
            _loc4_ = this.var_346.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,_loc1_,this.page);
      }
   }
}
