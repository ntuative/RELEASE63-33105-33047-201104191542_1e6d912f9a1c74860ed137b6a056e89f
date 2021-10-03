package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1946:int;
      
      private var var_2753:String;
      
      private var var_294:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1946 = param1.readInteger();
         this.var_2753 = param1.readString();
         this.var_294 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1946;
      }
      
      public function get nodeName() : String
      {
         return this.var_2753;
      }
      
      public function get visible() : Boolean
      {
         return this.var_294;
      }
   }
}
