package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_343:int;
      
      private var var_2463:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_343 = param1;
         this.var_2463 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_343,this.var_2463];
      }
      
      public function dispose() : void
      {
      }
   }
}
