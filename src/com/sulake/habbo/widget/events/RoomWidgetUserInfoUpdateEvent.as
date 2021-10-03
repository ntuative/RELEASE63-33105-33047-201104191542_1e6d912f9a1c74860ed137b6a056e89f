package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_125:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_109:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_724:int = 2;
      
      public static const const_938:int = 3;
      
      public static const const_1727:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1945:String = "";
      
      private var var_2197:int;
      
      private var var_2655:int = 0;
      
      private var var_2658:int = 0;
      
      private var var_622:String = "";
      
      private var var_49:BitmapData = null;
      
      private var var_276:Array;
      
      private var var_1415:int = 0;
      
      private var var_2333:String = "";
      
      private var var_2332:int = 0;
      
      private var var_2331:int = 0;
      
      private var var_1906:Boolean = false;
      
      private var var_1668:String = "";
      
      private var var_2783:Boolean = false;
      
      private var var_2776:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2779:Boolean = false;
      
      private var var_2780:Boolean = false;
      
      private var var_2775:Boolean = false;
      
      private var var_2781:Boolean = false;
      
      private var var_2782:Boolean = false;
      
      private var var_2778:Boolean = false;
      
      private var var_2777:int = 0;
      
      private var var_1905:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_276 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1945 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1945;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2197 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2197;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2655 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2655;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2658 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2658;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_622 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_622;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_49 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_49;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_276 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_276;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1415 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1415;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2333 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2333;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2783 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2783;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2779 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2779;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2780 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2780;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2775 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2775;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2781 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2781;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2782 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2782;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2778 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2778;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2777 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2777;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2776 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2776;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1905 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1905;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2332 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2332;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2331 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2331;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1906 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1906;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1668 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1668;
      }
   }
}
