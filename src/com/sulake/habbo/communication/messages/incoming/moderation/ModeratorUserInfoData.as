package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2593:int;
      
      private var var_2591:int;
      
      private var var_717:Boolean;
      
      private var var_2592:int;
      
      private var var_2590:int;
      
      private var var_2595:int;
      
      private var var_2594:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2593 = param1.readInteger();
         this.var_2591 = param1.readInteger();
         this.var_717 = param1.readBoolean();
         this.var_2592 = param1.readInteger();
         this.var_2590 = param1.readInteger();
         this.var_2595 = param1.readInteger();
         this.var_2594 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2593;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2591;
      }
      
      public function get online() : Boolean
      {
         return this.var_717;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2592;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2590;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2595;
      }
      
      public function get banCount() : int
      {
         return this.var_2594;
      }
   }
}
