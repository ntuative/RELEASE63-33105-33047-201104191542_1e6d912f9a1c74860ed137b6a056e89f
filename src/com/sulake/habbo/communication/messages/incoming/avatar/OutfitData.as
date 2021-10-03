package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1809:int;
      
      private var var_2638:String;
      
      private var var_943:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1809 = param1.readInteger();
         this.var_2638 = param1.readString();
         this.var_943 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1809;
      }
      
      public function get figureString() : String
      {
         return this.var_2638;
      }
      
      public function get gender() : String
      {
         return this.var_943;
      }
   }
}
