package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.roomsettings.FlatControllerData;
   import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomSettingsData;
   
   public class RoomSettingsDataMessageParser implements IMessageParser
   {
       
      
      private var var_127:RoomSettingsData;
      
      public function RoomSettingsDataMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_127 = new RoomSettingsData();
         this.var_127.roomId = param1.readInteger();
         this.var_127.name = param1.readString();
         this.var_127.description = param1.readString();
         this.var_127.doorMode = param1.readInteger();
         this.var_127.categoryId = param1.readInteger();
         this.var_127.maximumVisitors = param1.readInteger();
         this.var_127.maximumVisitorsLimit = param1.readInteger();
         this.var_127.tags = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_127.tags.push(param1.readString());
            _loc3_++;
         }
         this.var_127.controllers = [];
         var _loc4_:int = param1.readInteger();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            this.var_127.controllers.push(new FlatControllerData(param1));
            _loc5_++;
         }
         this.var_127.controllerCount = param1.readInteger();
         this.var_127.allowPets = param1.readInteger() == 1;
         this.var_127.allowFoodConsume = param1.readInteger() == 1;
         this.var_127.allowWalkThrough = param1.readInteger() == 1;
         this.var_127.hideWalls = param1.readInteger() == 1;
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_127 = null;
         return true;
      }
      
      public function get data() : RoomSettingsData
      {
         return this.var_127;
      }
   }
}
