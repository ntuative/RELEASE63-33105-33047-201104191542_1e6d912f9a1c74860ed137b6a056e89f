package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_65:String = "i";
      
      public static const const_81:String = "s";
      
      public static const const_207:String = "e";
       
      
      private var var_1567:String;
      
      private var var_2320:int;
      
      private var var_1288:String;
      
      private var _productCount:int;
      
      private var var_2000:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1567 = param1.readString();
         this.var_2320 = param1.readInteger();
         this.var_1288 = param1.readString();
         this._productCount = param1.readInteger();
         this.var_2000 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1567;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2320;
      }
      
      public function get extraParam() : String
      {
         return this.var_1288;
      }
      
      public function get productCount() : int
      {
         return this._productCount;
      }
      
      public function get expiration() : int
      {
         return this.var_2000;
      }
   }
}
