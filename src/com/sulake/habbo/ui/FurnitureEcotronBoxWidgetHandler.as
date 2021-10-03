package com.sulake.habbo.ui
{
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetEcotronBoxDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetEcotronBoxOpenMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetEcotronBoxOpenedMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class FurnitureEcotronBoxWidgetHandler implements IRoomWidgetHandler, IGetImageListener
   {
       
      
      private var var_1071:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_343:int = -1;
      
      private var _name:String = "";
      
      public function FurnitureEcotronBoxWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1071;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_507;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
      }
      
      public function dispose() : void
      {
         this.var_1071 = true;
         this._container = null;
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetFurniToWidgetMessage.const_714,RoomWidgetEcotronBoxOpenMessage.const_800,RoomWidgetEcotronBoxOpenedMessage.const_1670];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         switch(param1.type)
         {
            case RoomWidgetFurniToWidgetMessage.const_714:
               _loc2_ = param1 as RoomWidgetFurniToWidgetMessage;
               _loc3_ = this._container.roomEngine.getRoomObject(_loc2_.roomId,_loc2_.roomCategory,_loc2_.id,_loc2_.category);
               if(_loc3_ != null)
               {
                  _loc5_ = _loc3_.getModel();
                  if(_loc5_ != null)
                  {
                     this.var_343 = _loc2_.id;
                     _loc6_ = _loc5_.getString(RoomObjectVariableEnum.const_89);
                     if(_loc6_ == null)
                     {
                        return null;
                     }
                     _loc7_ = this._container.roomSession.isRoomOwner || this._container.sessionDataManager.isAnyRoomController;
                     _loc8_ = new RoomWidgetEcotronBoxDataUpdateEvent(RoomWidgetEcotronBoxDataUpdateEvent.const_72,_loc2_.id,_loc6_,_loc7_);
                     this._container.events.dispatchEvent(_loc8_);
                  }
               }
               break;
            case RoomWidgetEcotronBoxOpenMessage.const_800:
               _loc4_ = param1 as RoomWidgetEcotronBoxOpenMessage;
               if(_loc4_.objectId != this.var_343)
               {
                  return null;
               }
               if(this._container != null && this._container.roomSession != null)
               {
                  this._container.roomSession.sendPresentOpenMessage(_loc4_.objectId);
               }
               break;
         }
         return null;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(this.disposed)
         {
            return;
         }
         var _loc3_:RoomWidgetEcotronBoxDataUpdateEvent = new RoomWidgetEcotronBoxDataUpdateEvent(RoomWidgetEcotronBoxDataUpdateEvent.const_87,0,this._name,false,param2);
         this._container.events.dispatchEvent(_loc3_);
      }
      
      public function getProcessedEvents() : Array
      {
         return [RoomSessionPresentEvent.const_354];
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(this._container != null && this._container.events != null && param1 != null)
         {
            switch(param1.type)
            {
               case RoomSessionPresentEvent.const_354:
                  _loc2_ = param1 as RoomSessionPresentEvent;
                  if(_loc2_ != null)
                  {
                     _loc3_ = null;
                     this._name = "";
                     if(_loc2_.itemType == "s")
                     {
                        _loc3_ = this._container.roomEngine.getFurnitureIcon(_loc2_.classId,this);
                        _loc4_ = this._container.sessionDataManager.getFloorItemData(_loc2_.classId);
                     }
                     else if(_loc2_.itemType == "i")
                     {
                        _loc3_ = this._container.roomEngine.getWallItemIcon(_loc2_.classId,this);
                        _loc4_ = this._container.sessionDataManager.getWallItemData(_loc2_.classId);
                     }
                     if(_loc4_ != null)
                     {
                        this._name = _loc4_.title;
                     }
                     if(_loc3_ != null)
                     {
                        _loc5_ = new RoomWidgetEcotronBoxDataUpdateEvent(RoomWidgetEcotronBoxDataUpdateEvent.const_87,0,this._name,false,_loc3_.data);
                        this._container.events.dispatchEvent(_loc5_);
                        break;
                     }
                     break;
                  }
            }
         }
      }
      
      public function update() : void
      {
      }
   }
}
