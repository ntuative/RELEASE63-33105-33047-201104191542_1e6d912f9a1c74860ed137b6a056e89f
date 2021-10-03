package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2533:int;
      
      private var var_2535:int;
      
      private var var_2534:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2533 = param1;
         this.var_2535 = param2;
         this.var_2534 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2533,this.var_2535,this.var_2534];
      }
      
      public function dispose() : void
      {
      }
   }
}
