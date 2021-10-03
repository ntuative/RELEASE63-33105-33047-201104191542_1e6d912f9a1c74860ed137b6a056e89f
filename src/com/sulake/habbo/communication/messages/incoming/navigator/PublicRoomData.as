package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2349:String;
      
      private var var_2348:int;
      
      private var var_2350:int;
      
      private var var_2352:String;
      
      private var var_2351:int;
      
      private var var_1946:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2349 = param1.readString();
         this.var_2348 = param1.readInteger();
         this.var_2350 = param1.readInteger();
         this.var_2352 = param1.readString();
         this.var_2351 = param1.readInteger();
         this.var_1946 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2349;
      }
      
      public function get unitPort() : int
      {
         return this.var_2348;
      }
      
      public function get worldId() : int
      {
         return this.var_2350;
      }
      
      public function get castLibs() : String
      {
         return this.var_2352;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2351;
      }
      
      public function get nodeId() : int
      {
         return this.var_1946;
      }
   }
}
