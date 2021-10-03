package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1398:int;
      
      private var var_293:String;
      
      private var var_2730:int;
      
      private var var_2309:int;
      
      private var var_1712:int;
      
      private var var_2731:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1398 = param1.readInteger();
         this.var_293 = param1.readString();
         this.var_2730 = param1.readInteger();
         this.var_2309 = param1.readInteger();
         this.var_1712 = param1.readInteger();
         this.var_2731 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_293;
      }
      
      public function get level() : int
      {
         return this.var_1398;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2730;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2309;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1712;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2731;
      }
   }
}
