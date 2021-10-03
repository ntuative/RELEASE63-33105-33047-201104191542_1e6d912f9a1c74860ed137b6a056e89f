package com.sulake.habbo.widget.avatarinfo
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AvatarInfoWidget extends RoomWidgetBase implements IUpdateReceiver
   {
       
      
      private var var_22:Component;
      
      private var var_195:IHabboConfigurationManager;
      
      private var _view:AvatarInfoView;
      
      private var var_196:Boolean = false;
      
      private var var_1676:Boolean = false;
      
      private var var_1234:Timer;
      
      private var var_2945:int = 3000;
      
      private var var_1509:Boolean;
      
      private var var_988:Boolean;
      
      private var var_705:Number;
      
      private var var_1508:int;
      
      private var var_2944:int = 500;
      
      private var var_311:AvatarInfoData;
      
      public function AvatarInfoWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboConfigurationManager, param4:IHabboLocalizationManager, param5:Component)
      {
         super(param1,param2,param4);
         this.var_22 = param5;
         this.var_195 = param3;
         this.var_1509 = false;
         this.var_988 = false;
         this.var_1234 = new Timer(this.var_2945,1);
         this.var_1234.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this.var_311 = new AvatarInfoData();
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_195;
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.var_988 = true;
         this.var_1508 = 0;
      }
      
      private function getOwnCharacterInfo() : void
      {
         messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_783,0,0));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(this.var_22)
         {
            this.var_22.removeUpdateReceiver(this);
            this.var_22 = null;
         }
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
         this.var_195 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetAvatarInfoEvent.const_128,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_125,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_109,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_113,this.updateEventHandler);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_346,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.const_110,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserDataUpdateEvent.const_118,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_173,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_91,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_364,this.updateEventHandler);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetAvatarInfoEvent.const_128,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_125,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_109,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_113,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_346,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.const_110,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserDataUpdateEvent.const_118,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_173,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_91,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_364,this.updateEventHandler);
      }
      
      private function updateEventHandler(param1:RoomWidgetUpdateEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(param1.type)
         {
            case RoomWidgetAvatarInfoEvent.const_128:
               _loc2_ = param1 as RoomWidgetAvatarInfoEvent;
               this.updateView(_loc2_.userId,_loc2_.userName,_loc2_.roomIndex,RoomObjectTypeEnum.const_203,_loc2_.allowNameChange,null);
               this.var_196 = true;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_113:
            case RoomWidgetFurniInfoUpdateEvent.const_346:
               this.removeView();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_125:
               this.getOwnCharacterInfo();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_109:
               _loc3_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.var_311.amIAnyRoomController = _loc3_.amIAnyRoomController;
               this.var_311.amIController = _loc3_.amIController;
               this.var_311.amIOwner = _loc3_.amIOwner;
               this.var_311.canBeAskedAsFriend = _loc3_.canBeAskedAsFriend;
               this.var_311.canBeKicked = _loc3_.canBeKicked;
               this.var_311.canTrade = _loc3_.canTrade;
               this.var_311.canTradeReason = _loc3_.canTradeReason;
               this.var_311.hasFlatControl = _loc3_.hasFlatControl;
               this.var_311.isIgnored = _loc3_.isIgnored;
               this.var_311.respectLeft = _loc3_.respectLeft;
               this.updateView(_loc3_.webID,_loc3_.name,_loc3_.userRoomId,RoomObjectTypeEnum.const_203,false,!!_loc3_.isSpectatorMode ? null : this.var_311);
               break;
            case RoomWidgetUserInfoUpdateEvent.BOT:
               _loc4_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc4_.webID,_loc4_.name,_loc4_.userRoomId,RoomObjectTypeEnum.const_939,false,null);
               break;
            case RoomWidgetPetInfoUpdateEvent.const_110:
               _loc5_ = param1 as RoomWidgetPetInfoUpdateEvent;
               this.updateView(_loc5_.id,_loc5_.name,_loc5_.roomIndex,RoomObjectTypeEnum.const_188,false,null);
               break;
            case RoomWidgetUserDataUpdateEvent.const_118:
               if(!this.var_196)
               {
                  this.getOwnCharacterInfo();
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_173:
               _loc6_ = param1 as RoomWidgetRoomObjectUpdateEvent;
               if(this._view && this._view.roomIndex == _loc6_.id)
               {
                  this.disposeView();
               }
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_91:
               this.var_1676 = false;
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_364:
               this.var_1676 = true;
         }
         this.checkUpdateNeed();
      }
      
      private function updateView(param1:int, param2:String, param3:int, param4:int, param5:Boolean, param6:AvatarInfoData) : void
      {
         this.var_988 = false;
         if(this.var_1234.running)
         {
            this.var_1234.stop();
         }
         if(this._view == null || this._view.userId != param1 || this._view.userName != param2 || this._view.roomIndex != param3 || this._view.userType != param4)
         {
            if(this._view)
            {
               this.disposeView();
            }
            if(!this.var_1676)
            {
               if(param6 && false)
               {
                  this._view = new AvatarMenuView(this,param1,param2,param3,param4,param6);
               }
               else
               {
                  this._view = new AvatarInfoView(this,param1,param2,param3,param4,param5);
               }
            }
         }
      }
      
      public function disposeView() : void
      {
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
            this.var_1509 = true;
            this.var_988 = false;
         }
      }
      
      private function removeView() : void
      {
         if(!this.var_1509)
         {
            this.var_1509 = true;
            this.var_1234.start();
         }
         else if(!this.var_988)
         {
            this.disposeView();
         }
      }
      
      public function checkUpdateNeed() : void
      {
         if(!this.var_22)
         {
            return;
         }
         if(this._view)
         {
            this.var_22.registerUpdateReceiver(this,10);
         }
         else
         {
            this.var_22.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(!this._view)
         {
            return;
         }
         _loc2_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(this._view.userId,this._view.userType)) as RoomWidgetUserLocationUpdateEvent;
         if(!_loc2_)
         {
            return;
         }
         if(this.var_988)
         {
            this.var_1508 += param1;
            this.var_705 = 1 - this.var_1508 / Number(this.var_2944);
         }
         else
         {
            this.var_705 = 1;
         }
         if(this.var_705 <= 0)
         {
            this.disposeView();
            return;
         }
         this._view.update(_loc2_.rectangle,this.var_705);
      }
   }
}
