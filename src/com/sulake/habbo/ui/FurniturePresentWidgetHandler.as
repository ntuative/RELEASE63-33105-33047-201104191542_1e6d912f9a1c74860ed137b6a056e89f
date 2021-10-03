package com.sulake.habbo.ui
{
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetPresentDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetPresentOpenMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class FurniturePresentWidgetHandler implements IRoomWidgetHandler, IGetImageListener
   {
      
      private static const const_217:String = "floor";
      
      private static const const_218:String = "wallpaper";
      
      private static const TYPE_LANDSCAPE:String = "landscape";
      
      private static const const_1461:String = "poster";
       
      
      private var var_1071:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_343:int = -1;
      
      private var _name:String = "";
      
      public function FurniturePresentWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1071;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_557;
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
         return [RoomWidgetFurniToWidgetMessage.const_785,RoomWidgetPresentOpenMessage.const_164];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:Boolean = false;
         var _loc11_:* = null;
         switch(param1.type)
         {
            case RoomWidgetFurniToWidgetMessage.const_785:
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
                        _loc6_ = "";
                     }
                     _loc6_ = _loc6_.substr(1);
                     _loc7_ = _loc5_.getNumber(RoomObjectVariableEnum.const_352);
                     _loc8_ = _loc5_.getString(RoomObjectVariableEnum.const_328);
                     _loc9_ = this._container.roomEngine.getFurnitureImage(_loc7_,new Vector3d(180),64,null,0,_loc8_);
                     _loc10_ = this._container.roomSession.isRoomOwner || this._container.sessionDataManager.isAnyRoomController;
                     _loc11_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_72,_loc2_.id,_loc6_,_loc10_,_loc9_.data);
                     this._container.events.dispatchEvent(_loc11_);
                  }
               }
               break;
            case RoomWidgetPresentOpenMessage.const_164:
               _loc4_ = param1 as RoomWidgetPresentOpenMessage;
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
         var _loc3_:RoomWidgetPresentDataUpdateEvent = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_87,0,this._name,false,param2);
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
         var _loc6_:* = null;
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
                     this._name = "";
                     _loc4_ = null;
                     if(_loc2_.itemType == ProductTypeEnum.const_81)
                     {
                        _loc3_ = this._container.sessionDataManager.getFloorItemData(_loc2_.classId);
                     }
                     else if(_loc2_.itemType == ProductTypeEnum.const_65)
                     {
                        _loc3_ = this._container.sessionDataManager.getWallItemData(_loc2_.classId);
                     }
                     switch(_loc2_.itemType)
                     {
                        case ProductTypeEnum.const_65:
                           if(_loc3_ != null && _loc3_.name == const_217)
                           {
                              _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_623,0,this._container.localization.getKey("inventory.furni.item.floor.name"),false,null);
                           }
                           else if(_loc3_ != null && _loc3_.name == TYPE_LANDSCAPE)
                           {
                              _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_509,0,this._container.localization.getKey("inventory.furni.item.landscape.name"),false,null);
                           }
                           else if(_loc3_ != null && _loc3_.name == const_218)
                           {
                              _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_463,0,this._container.localization.getKey("inventory.furni.item.wallpaper.name"),false,null);
                           }
                           else
                           {
                              if(_loc3_ != null && _loc3_.name == const_1461)
                              {
                                 break;
                              }
                              _loc4_ = this._container.roomEngine.getWallItemIcon(_loc2_.classId,this);
                              if(_loc3_ != null)
                              {
                                 this._name = _loc3_.title;
                              }
                              if(_loc4_ != null)
                              {
                                 _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_87,0,this._name,false,_loc4_.data);
                              }
                           }
                           break;
                        case ProductTypeEnum.const_325:
                           _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_570,0,this._container.localization.getKey("widget.furni.present.hc"),false,null);
                           break;
                        default:
                           _loc4_ = this._container.roomEngine.getFurnitureImage(_loc2_.classId,new Vector3d(180),32,this);
                           _loc6_ = this._container.sessionDataManager.getProductData(_loc2_.productCode);
                           if(_loc6_ != null)
                           {
                              this._name = _loc6_.name;
                           }
                           else if(_loc3_ != null)
                           {
                              this._name = _loc3_.title;
                           }
                           if(_loc4_ != null)
                           {
                              _loc5_ = new RoomWidgetPresentDataUpdateEvent(RoomWidgetPresentDataUpdateEvent.const_87,0,this._name,false,_loc4_.data);
                           }
                     }
                     if(_loc5_ != null)
                     {
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
