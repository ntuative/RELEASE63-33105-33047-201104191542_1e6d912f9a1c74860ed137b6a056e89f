package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.widget.enums.RoomWidgetInfostandExtraParamEnum;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class FurnitureSongDiskLogic extends FurnitureLogic
   {
       
      
      public function FurnitureSongDiskLogic()
      {
         super();
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         super.processUpdateMessage(param1);
         if(object == null)
         {
            return;
         }
         if(object.getModelController().getNumber(RoomObjectVariableEnum.const_779) == 1)
         {
            _loc2_ = object.getModelController().getString(RoomObjectVariableEnum.const_328);
            _loc3_ = int(_loc2_);
            object.getModelController().setString(RoomWidgetInfostandExtraParamEnum.const_413,RoomWidgetInfostandExtraParamEnum.const_405 + _loc3_);
         }
      }
   }
}
