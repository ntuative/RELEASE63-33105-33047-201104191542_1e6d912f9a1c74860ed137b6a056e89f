package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_353:int;
      
      private var var_801:Boolean;
      
      private var var_912:String;
      
      private var _ownerName:String;
      
      private var var_2493:int;
      
      private var var_2376:int;
      
      private var var_2662:int;
      
      private var var_1745:String;
      
      private var var_2667:int;
      
      private var var_2663:Boolean;
      
      private var var_832:int;
      
      private var var_1599:int;
      
      private var var_2665:String;
      
      private var var_875:Array;
      
      private var var_2664:RoomThumbnailData;
      
      private var var_2499:Boolean;
      
      private var var_2666:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_875 = new Array();
         super();
         this.var_353 = param1.readInteger();
         this.var_801 = param1.readBoolean();
         this.var_912 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2493 = param1.readInteger();
         this.var_2376 = param1.readInteger();
         this.var_2662 = param1.readInteger();
         this.var_1745 = param1.readString();
         this.var_2667 = param1.readInteger();
         this.var_2663 = param1.readBoolean();
         this.var_832 = param1.readInteger();
         this.var_1599 = param1.readInteger();
         this.var_2665 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_875.push(_loc4_);
            _loc3_++;
         }
         this.var_2664 = new RoomThumbnailData(param1);
         this.var_2499 = param1.readBoolean();
         this.var_2666 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_875 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_353;
      }
      
      public function get event() : Boolean
      {
         return this.var_801;
      }
      
      public function get roomName() : String
      {
         return this.var_912;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2493;
      }
      
      public function get userCount() : int
      {
         return this.var_2376;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2662;
      }
      
      public function get description() : String
      {
         return this.var_1745;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2667;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2663;
      }
      
      public function get score() : int
      {
         return this.var_832;
      }
      
      public function get categoryId() : int
      {
         return this.var_1599;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2665;
      }
      
      public function get tags() : Array
      {
         return this.var_875;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2664;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2499;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2666;
      }
   }
}
