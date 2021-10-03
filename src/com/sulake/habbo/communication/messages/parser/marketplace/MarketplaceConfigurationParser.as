package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1455:Boolean;
      
      private var var_2506:int;
      
      private var var_1925:int;
      
      private var var_1926:int;
      
      private var var_2502:int;
      
      private var var_2504:int;
      
      private var var_2503:int;
      
      private var var_2505:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1455;
      }
      
      public function get commission() : int
      {
         return this.var_2506;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1925;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1926;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2504;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2502;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2503;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2505;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1455 = param1.readBoolean();
         this.var_2506 = param1.readInteger();
         this.var_1925 = param1.readInteger();
         this.var_1926 = param1.readInteger();
         this.var_2504 = param1.readInteger();
         this.var_2502 = param1.readInteger();
         this.var_2503 = param1.readInteger();
         this.var_2505 = param1.readInteger();
         return true;
      }
   }
}
