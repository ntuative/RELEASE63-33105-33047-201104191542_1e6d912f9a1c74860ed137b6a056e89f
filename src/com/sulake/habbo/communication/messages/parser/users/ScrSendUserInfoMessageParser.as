package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1971:int = 1;
      
      public static const const_1519:int = 2;
       
      
      private var var_913:String;
      
      private var var_2829:int;
      
      private var var_2830:int;
      
      private var var_2828:int;
      
      private var var_2826:int;
      
      private var var_2825:Boolean;
      
      private var var_2268:Boolean;
      
      private var var_2266:int;
      
      private var var_2267:int;
      
      private var var_2824:Boolean;
      
      private var var_2823:int;
      
      private var var_2827:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_913 = param1.readString();
         this.var_2829 = param1.readInteger();
         this.var_2830 = param1.readInteger();
         this.var_2828 = param1.readInteger();
         this.var_2826 = param1.readInteger();
         this.var_2825 = param1.readBoolean();
         this.var_2268 = param1.readBoolean();
         this.var_2266 = param1.readInteger();
         this.var_2267 = param1.readInteger();
         this.var_2824 = param1.readBoolean();
         this.var_2823 = param1.readInteger();
         this.var_2827 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_913;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2829;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2830;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2828;
      }
      
      public function get responseType() : int
      {
         return this.var_2826;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2825;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2268;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2266;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2267;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2824;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2823;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2827;
      }
   }
}
