package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomChatlogData
   {
       
      
      private var var_1807:Boolean;
      
      private var _roomId:int;
      
      private var var_912:String;
      
      private var var_1808:Array;
      
      public function RoomChatlogData(param1:IMessageDataWrapper)
      {
         this.var_1808 = new Array();
         super();
         this.var_1807 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_912 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1808.push(new ChatlineData(param1));
            _loc3_++;
         }
         Logger.log("READ ROOMCHATLOGDATA: " + this.var_1807 + ", " + this._roomId + ", " + this.var_912 + ", " + this.chatlog.length);
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_1807;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_912;
      }
      
      public function get chatlog() : Array
      {
         return this.var_1808;
      }
   }
}
