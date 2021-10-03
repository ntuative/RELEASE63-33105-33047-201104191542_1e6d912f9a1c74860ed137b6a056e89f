package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_353:int;
      
      private var var_2376:int;
      
      private var var_2861:Boolean;
      
      private var var_2227:int;
      
      private var _ownerName:String;
      
      private var var_126:RoomData;
      
      private var var_801:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_353 = param1.readInteger();
         this.var_2376 = param1.readInteger();
         this.var_2861 = param1.readBoolean();
         this.var_2227 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_126 = new RoomData(param1);
         this.var_801 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_126 != null)
         {
            this.var_126.dispose();
            this.var_126 = null;
         }
         if(this.var_801 != null)
         {
            this.var_801.dispose();
            this.var_801 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_353;
      }
      
      public function get userCount() : int
      {
         return this.var_2376;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2861;
      }
      
      public function get ownerId() : int
      {
         return this.var_2227;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_126;
      }
      
      public function get event() : RoomData
      {
         return this.var_801;
      }
   }
}
