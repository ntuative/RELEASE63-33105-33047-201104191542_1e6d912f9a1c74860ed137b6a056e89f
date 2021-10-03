package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class AddGuestBookMessageComposer implements IMessageComposer
   {
       
      
      private var var_1856:int;
      
      private var var_432:String;
      
      private var _message:String;
      
      public function AddGuestBookMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         this.var_1856 = param1;
         this.var_432 = param2;
         this._message = param3;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_1856,this.var_432,this._message];
      }
   }
}
