package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_111:String = "me_menu_top_view";
      
      public static const const_1621:String = "me_menu_rooms_view";
      
      public static const const_338:String = "me_menu_my_clothes_view";
      
      public static const const_1244:String = "me_menu_dance_moves_view";
      
      public static const const_920:String = "me_menu_effects_view";
      
      public static const const_887:String = "me_menu_settings_view";
      
      public static const const_936:String = "me_menu_sound_settings";
      
      private static const const_1324:int = 5000;
      
      private static const const_982:Point = new Point(95,185);
       
      
      private var var_47:IMeMenuView;
      
      private var _mainContainer:IWindowContainer;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1100:Point;
      
      private var var_1378:int = 0;
      
      private var var_2233:int = 0;
      
      private var var_2236:int = 0;
      
      private var var_2237:Boolean = false;
      
      private var var_1677:int = 0;
      
      private var var_1101:Boolean = false;
      
      private var var_2234:Boolean = false;
      
      private var var_341:Boolean = false;
      
      private var var_2232:int = 0;
      
      private var var_2235:Boolean = false;
      
      private var var_1675:int = 0;
      
      private var var_1676:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_898:Boolean;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         this._config = param5;
         this.var_1100 = new Point(0,0);
         this._eventDispatcher = param4;
         this.var_898 = this._config.getKey("client.toolbar.static.enabled","RoomWidgetDimmerUpdateEvent") == "true";
         if(param5 != null && false)
         {
            this.var_2235 = param5.getKey("client.news.embed.enabled","RoomWidgetDimmerUpdateEvent") == "true";
         }
         this.changeView(const_111);
         this.hide();
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         this.hide();
         this._eventDispatcher = null;
         if(this.var_47 != null)
         {
            this.var_47.dispose();
            this.var_47 = null;
         }
         super.dispose();
      }
      
      override public function get mainWindow() : IWindow
      {
         return this._mainContainer;
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_836,this.onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_904,this.onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_835,this.onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_821,this.onToolbarClicked);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_818,this.onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_876,this.onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_113,this.onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_278,this.onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_827,this.onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_125,this.onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_401,this.onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_130,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_476,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_69,this.onCreditBalance);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_91,this.onNormalMode);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_364,this.onGameMode);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_836,this.onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_904,this.onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_835,this.onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_821,this.onToolbarClicked);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_113,this.onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_278,this.onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_827,this.onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_818,this.onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_876,this.onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_125,this.onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_401,this.onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_476,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_130,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_69,this.onCreditBalance);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_91,this.onNormalMode);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_91,this.onGameMode);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:* = null;
         if(!this.var_898)
         {
            _loc2_ = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_911);
            _loc2_.window = this._mainContainer.parent as IWindowContainer;
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
         if(this.var_47 != null)
         {
            this._mainContainer.removeChild(this.var_47.window);
            this.var_47.dispose();
            this.var_47 = null;
         }
         if(this.var_898)
         {
            this._mainContainer.visible = false;
         }
         this.var_341 = false;
         this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function show() : void
      {
         var _loc1_:* = null;
         if(!this._mainContainer || !this._mainContainer.parent)
         {
            return;
         }
         this.changeView(const_111);
         if(!this.var_898)
         {
            _loc1_ = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_730);
            _loc1_.window = this._mainContainer.parent as IWindowContainer;
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc1_);
            }
            this.var_341 = true;
         }
         else
         {
            this._mainContainer.position = const_982;
            this._mainContainer.visible = true;
            this.var_341 = true;
         }
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(this.var_341 && this.var_47.window.name == const_338))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_831);
            if(messageListener != null)
            {
               if(!this.var_1676)
               {
                  messageListener.processWidgetMessage(_loc2_);
               }
            }
         }
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!this.var_341)
         {
            return;
         }
         if(this.var_47.window.name == const_936)
         {
            (this.var_47 as MeMenuSoundSettingsView).updateSettings(param1);
         }
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_476:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + this.var_341 + " view: " + this.var_47.window.name);
               if(this.var_341 != true || this.var_47.window.name != const_111)
               {
                  return;
               }
               (this.var_47 as MeMenuMainView).setIconAssets("clothes_icon",const_111,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_130:
               this.hide();
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               this.var_341 = !this.var_341;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               this.var_341 = false;
               break;
            default:
               return;
         }
         if(this.var_341)
         {
            this.show();
         }
         else
         {
            this.hide();
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         this.var_1101 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               this.var_1101 = true;
            }
         }
         if(this.var_47 != null && this.var_47.window.name == const_920)
         {
            (this.var_47 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(this.var_47 != null && this.var_47.window.name != const_338)
         {
            this.hide();
         }
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_47 != null && this.var_47.window.name == const_338)
         {
            this.changeView(const_111);
         }
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_47 != null && this.var_47.window.name == const_338)
         {
            this.changeView(const_111);
         }
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != this.var_1378;
         this.var_1378 = param1.daysLeft;
         this.var_2233 = param1.periodsLeft;
         this.var_2236 = param1.pastPeriods;
         this.var_2237 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != this.var_1677);
         this.var_1677 = param1.clubLevel;
         if(_loc2_)
         {
            if(this.var_47 != null)
            {
               this.changeView(this.var_47.window.name);
            }
         }
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               this.var_1101 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               this.var_1101 = false;
         }
      }
      
      private function onCreditBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.var_1675 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",this.var_1675.toString());
      }
      
      private function onNormalMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1676 = false;
      }
      
      private function onGameMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1676 = true;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1362,HabboWindowStyle.const_1216,HabboWindowParam.const_45,new Rectangle(0,0,170,260)) as IWindowContainer;
            if(!this.var_898)
            {
               this._mainContainer.tags.push("room_widget_me_menu");
            }
         }
         return this._mainContainer;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_111:
               _loc2_ = new MeMenuMainView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_920:
               _loc2_ = new MeMenuEffectsView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_1244:
               _loc2_ = new MeMenuDanceView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_338:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1621:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_887:
               _loc2_ = new MeMenuSettingsMenuView();
               break;
            case const_936:
               _loc2_ = new MeMenuSoundSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(this.var_47 != null)
            {
               this._mainContainer.removeChild(this.var_47.window);
               this.var_47.dispose();
               this.var_47 = null;
            }
            this.var_47 = _loc2_;
            this.var_47.init(this,param1);
         }
         this.updateSize();
         if(this.var_898 && param1 == const_111)
         {
            this.mainContainer.position = const_982;
         }
      }
      
      public function updateSize() : void
      {
         if(this.var_47 != null)
         {
            this.var_1100.x = this.var_47.window.width + 10;
            this.var_1100.y = this.var_47.window.height;
            this.var_47.window.x = 5;
            this.var_47.window.y = 0;
            this._mainContainer.width = this.var_1100.x;
            this._mainContainer.height = this.var_1100.y;
         }
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return this.var_2237;
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return this.var_1378 > 0;
      }
      
      public function get habboClubDays() : int
      {
         return this.var_1378;
      }
      
      public function get habboClubPeriods() : int
      {
         return this.var_2233;
      }
      
      public function get habboClubPastPeriods() : int
      {
         return this.var_2236;
      }
      
      public function get habboClubLevel() : int
      {
         return this.var_1677;
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return this.var_2235;
      }
      
      public function get creditBalance() : int
      {
         return this.var_1675;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         this.var_2232 = getTimer();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = getTimer();
         return _loc1_ - this.var_2232 > const_1324;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return this.var_1101;
      }
      
      public function get isDancing() : Boolean
      {
         return this.var_2234;
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         this.var_2234 = param1;
      }
   }
}
