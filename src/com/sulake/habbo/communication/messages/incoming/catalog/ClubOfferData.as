package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1660:String;
      
      private var var_1692:int;
      
      private var var_2275:Boolean;
      
      private var var_2272:Boolean;
      
      private var var_2276:int;
      
      private var var_2274:int;
      
      private var var_2277:int;
      
      private var var_2278:int;
      
      private var var_2273:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1660 = param1.readString();
         this.var_1692 = param1.readInteger();
         this.var_2275 = param1.readBoolean();
         this.var_2272 = param1.readBoolean();
         this.var_2276 = param1.readInteger();
         this.var_2274 = param1.readInteger();
         this.var_2277 = param1.readInteger();
         this.var_2278 = param1.readInteger();
         this.var_2273 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1660;
      }
      
      public function get price() : int
      {
         return this.var_1692;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2275;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2272;
      }
      
      public function get periods() : int
      {
         return this.var_2276;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2274;
      }
      
      public function get year() : int
      {
         return this.var_2277;
      }
      
      public function get month() : int
      {
         return this.var_2278;
      }
      
      public function get day() : int
      {
         return this.var_2273;
      }
   }
}
