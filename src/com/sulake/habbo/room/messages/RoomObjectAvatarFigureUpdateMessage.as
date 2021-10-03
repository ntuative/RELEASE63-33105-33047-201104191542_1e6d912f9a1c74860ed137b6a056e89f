package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_622:String;
      
      private var var_2244:String;
      
      private var var_943:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_622 = param1;
         this.var_943 = param2;
         this.var_2244 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_622;
      }
      
      public function get race() : String
      {
         return this.var_2244;
      }
      
      public function get gender() : String
      {
         return this.var_943;
      }
   }
}
