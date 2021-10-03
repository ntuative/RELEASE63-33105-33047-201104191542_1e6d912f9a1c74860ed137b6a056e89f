package com.sulake.habbo.friendbar.events
{
   import flash.events.Event;
   
   public class FriendBarUpdateEvent extends Event
   {
      
      public static const const_694:String = "FBE_UPDATED";
       
      
      public function FriendBarUpdateEvent()
      {
         super(const_694,false,false);
      }
   }
}
