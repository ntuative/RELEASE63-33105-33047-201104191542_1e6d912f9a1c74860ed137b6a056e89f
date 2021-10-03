package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2192:int;
      
      private var var_2191:int;
      
      private var var_1144:int;
      
      private var var_1143:int;
      
      private var var_1755:int;
      
      private var var_2193:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2192 = param1.readInteger();
         this.var_2191 = param1.readInteger();
         this.var_1144 = param1.readInteger();
         this.var_1143 = param1.readInteger();
         this.var_1755 = param1.readInteger();
         this.var_2193 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2192;
      }
      
      public function get charges() : int
      {
         return this.var_2191;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1144;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1143;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2193;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1755;
      }
   }
}
