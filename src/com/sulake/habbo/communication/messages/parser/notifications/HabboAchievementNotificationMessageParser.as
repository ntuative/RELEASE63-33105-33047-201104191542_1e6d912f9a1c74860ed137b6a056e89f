package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1398:int;
      
      private var var_1642:int;
      
      private var var_2309:int;
      
      private var var_1712:int;
      
      private var var_1397:int;
      
      private var var_2154:String = "";
      
      private var var_2364:String = "";
      
      private var var_2363:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1398 = param1.readInteger();
         this.var_2154 = param1.readString();
         this.var_1642 = param1.readInteger();
         this.var_2309 = param1.readInteger();
         this.var_1712 = param1.readInteger();
         this.var_1397 = param1.readInteger();
         this.var_2363 = param1.readInteger();
         this.var_2364 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1398;
      }
      
      public function get points() : int
      {
         return this.var_1642;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2309;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1712;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1397;
      }
      
      public function get badgeID() : String
      {
         return this.var_2154;
      }
      
      public function get achievementID() : int
      {
         return this.var_2363;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2364;
      }
   }
}
