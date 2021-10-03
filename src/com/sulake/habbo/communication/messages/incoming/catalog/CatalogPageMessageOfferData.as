package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1756:String;
      
      private var var_1144:int;
      
      private var var_1143:int;
      
      private var var_1755:int;
      
      private var var_1138:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1756 = param1.readString();
         this.var_1144 = param1.readInteger();
         this.var_1143 = param1.readInteger();
         this.var_1755 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1138 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1138.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
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
      
      public function get products() : Array
      {
         return this.var_1138;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1755;
      }
   }
}
