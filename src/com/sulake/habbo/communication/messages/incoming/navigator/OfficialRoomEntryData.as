package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1215:int = 1;
      
      public static const const_706:int = 2;
      
      public static const const_956:int = 3;
      
      public static const const_1782:int = 4;
       
      
      private var _index:int;
      
      private var var_2378:String;
      
      private var var_2380:String;
      
      private var var_2377:Boolean;
      
      private var var_2379:String;
      
      private var var_976:String;
      
      private var var_2381:int;
      
      private var var_2376:int;
      
      private var _type:int;
      
      private var var_2375:String;
      
      private var var_922:GuestRoomData;
      
      private var var_921:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2378 = param1.readString();
         this.var_2380 = param1.readString();
         this.var_2377 = param1.readInteger() == 1;
         this.var_2379 = param1.readString();
         this.var_976 = param1.readString();
         this.var_2381 = param1.readInteger();
         this.var_2376 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1215)
         {
            this.var_2375 = param1.readString();
         }
         else if(this._type == const_956)
         {
            this.var_921 = new PublicRoomData(param1);
         }
         else if(this._type == const_706)
         {
            this.var_922 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_922 != null)
         {
            this.var_922.dispose();
            this.var_922 = null;
         }
         if(this.var_921 != null)
         {
            this.var_921.dispose();
            this.var_921 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2378;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2380;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2377;
      }
      
      public function get picText() : String
      {
         return this.var_2379;
      }
      
      public function get picRef() : String
      {
         return this.var_976;
      }
      
      public function get folderId() : int
      {
         return this.var_2381;
      }
      
      public function get tag() : String
      {
         return this.var_2375;
      }
      
      public function get userCount() : int
      {
         return this.var_2376;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_922;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_921;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1215)
         {
            return 0;
         }
         if(this.type == const_706)
         {
            return this.var_922.maxUserCount;
         }
         if(this.type == const_956)
         {
            return this.var_921.maxUsers;
         }
         return 0;
      }
   }
}
