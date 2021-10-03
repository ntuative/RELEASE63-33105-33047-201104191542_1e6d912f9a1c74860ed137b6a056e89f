package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2341:Boolean;
      
      private var var_2342:int;
      
      private var var_1727:Array;
      
      private var var_757:Array;
      
      private var var_756:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2341;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2342;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1727;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_757;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_756;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1727 = [];
         this.var_757 = [];
         this.var_756 = [];
         this.var_2341 = param1.readBoolean();
         this.var_2342 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1727.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_757.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_756.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
