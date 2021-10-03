package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_278:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2431:int = 0;
      
      private var var_2429:int = 0;
      
      private var var_2428:int = 0;
      
      private var var_2430:Boolean = false;
      
      private var var_2282:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_278,param6,param7);
         this.var_2431 = param1;
         this.var_2429 = param2;
         this.var_2428 = param3;
         this.var_2430 = param4;
         this.var_2282 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2431;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2429;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2428;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2430;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2282;
      }
   }
}
