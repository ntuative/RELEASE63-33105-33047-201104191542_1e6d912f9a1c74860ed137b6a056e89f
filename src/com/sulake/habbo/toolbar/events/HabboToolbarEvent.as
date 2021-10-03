package com.sulake.habbo.toolbar.events
{
   import flash.events.Event;
   
   public class HabboToolbarEvent extends Event
   {
      
      public static const const_75:String = "HTE_INITIALIZED";
      
      public static const const_36:String = "HTE_TOOLBAR_CLICK";
      
      public static const const_465:String = "HTE_TOOLBAR_ORIENTATION";
      
      public static const const_930:String = "HTE_TOOLBAR_RESIZED";
      
      public static const const_589:String = "HTE_TOOLBAR_STATE_HOTEL_VIEW";
      
      public static const const_494:String = "HTE_TOOLBAR_STATE_ROOM_VIEW";
       
      
      private var var_787:String;
      
      private var var_542:String;
      
      private var var_1197:String;
      
      public function HabboToolbarEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set iconId(param1:String) : void
      {
         this.var_787 = param1;
      }
      
      public function get iconId() : String
      {
         return this.var_787;
      }
      
      public function set orientation(param1:String) : void
      {
         this.var_542 = param1;
      }
      
      public function get orientation() : String
      {
         return this.var_542;
      }
      
      public function set iconName(param1:String) : void
      {
         this.var_1197 = param1;
      }
      
      public function get iconName() : String
      {
         return this.var_1197;
      }
   }
}
