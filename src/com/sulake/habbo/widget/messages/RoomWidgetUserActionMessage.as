package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_546:String = "RWUAM_WHISPER_USER";
      
      public static const const_522:String = "RWUAM_IGNORE_USER";
      
      public static const const_490:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_379:String = "RWUAM_KICK_USER";
      
      public static const const_480:String = "RWUAM_BAN_USER";
      
      public static const const_487:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_558:String = "RWUAM_RESPECT_USER";
      
      public static const const_630:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_545:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_616:String = "RWUAM_START_TRADING";
      
      public static const const_941:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_484:String = "RWUAM_KICK_BOT";
      
      public static const const_543:String = "RWUAM_REPORT";
      
      public static const const_556:String = "RWUAM_PICKUP_PET";
      
      public static const const_1747:String = "RWUAM_TRAIN_PET";
      
      public static const const_564:String = " RWUAM_RESPECT_PET";
      
      public static const const_429:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_934:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
