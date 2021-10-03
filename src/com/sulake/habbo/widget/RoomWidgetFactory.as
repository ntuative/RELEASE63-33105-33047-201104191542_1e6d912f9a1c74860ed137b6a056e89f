package com.sulake.habbo.widget
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.navigator.IHabboNavigator;
   import com.sulake.habbo.quest.IHabboQuestEngine;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.widget.avatarinfo.AvatarInfoWidget;
   import com.sulake.habbo.widget.chatinput.RoomChatInputWidget;
   import com.sulake.habbo.widget.chatinput.RoomChatInputWidgetOld;
   import com.sulake.habbo.widget.chooser.FurniChooserWidget;
   import com.sulake.habbo.widget.chooser.UserChooserWidget;
   import com.sulake.habbo.widget.doorbell.DoorbellWidget;
   import com.sulake.habbo.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.widget.friendrequest.FriendRequestWidget;
   import com.sulake.habbo.widget.furniture.clothingchange.ClothingChangeFurnitureWidget;
   import com.sulake.habbo.widget.furniture.credit.CreditFurniWidget;
   import com.sulake.habbo.widget.furniture.dimmer.DimmerFurniWidget;
   import com.sulake.habbo.widget.furniture.ecotronbox.EcotronBoxFurniWidget;
   import com.sulake.habbo.widget.furniture.petpackage.PetPackageFurniWidget;
   import com.sulake.habbo.widget.furniture.placeholder.PlaceholderWidget;
   import com.sulake.habbo.widget.furniture.present.PresentFurniWidget;
   import com.sulake.habbo.widget.furniture.stickie.StickieFurniWidget;
   import com.sulake.habbo.widget.furniture.teaser.TeaserFurniWidget;
   import com.sulake.habbo.widget.furniture.trophy.TrophyFurniWidget;
   import com.sulake.habbo.widget.furniture.welcomegift.WelcomeGiftWidget;
   import com.sulake.habbo.widget.infostand.InfostandWidget;
   import com.sulake.habbo.widget.loadingbar.LoadingBarWidget;
   import com.sulake.habbo.widget.memenu.MeMenuWidget;
   import com.sulake.habbo.widget.notification.UserNotificationWidget;
   import com.sulake.habbo.widget.playlisteditor.PlayListEditorWidget;
   import com.sulake.habbo.widget.poll.PollWidget;
   import com.sulake.habbo.widget.poll.VoteWidget;
   import com.sulake.habbo.widget.purse.PurseWidget;
   import com.sulake.habbo.widget.roomchat.RoomChatWidget;
   import com.sulake.habbo.widget.roominfo.RoomInfoWidget;
   import com.sulake.habbo.widget.roomqueue.RoomQueueWidget;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboQuestEngine;
   import com.sulake.iid.IIDHabboSoundManager;
   import iid.IIDHabboWindowManager;
   
   public class RoomWidgetFactory extends Component implements IRoomWidgetFactory
   {
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_2920:IAssetLibrary;
      
      private var var_60:IHabboLocalizationManager;
      
      private var var_154:IHabboConfigurationManager;
      
      private var _questEngine:IHabboQuestEngine;
      
      private var _catalog:IHabboCatalog;
      
      private var _inventory:IHabboInventory;
      
      private var _soundManager:IHabboSoundManager;
      
      private var _navigator:IHabboNavigator;
      
      private var var_2202:int = 0;
      
      public function RoomWidgetFactory(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this.var_2920 = param1.root.assets;
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationReady);
         queueInterface(new IIDHabboCatalog(),this.onCatalogReady);
         queueInterface(new IIDHabboInventory(),this.onInventoryReady);
         queueInterface(new IIDHabboSoundManager(),this.onSoundManagerReady);
         queueInterface(new IIDHabboNavigator(),this.onNavigatorReady);
         queueInterface(new IIDHabboQuestEngine(),this.onQuestEngineReady);
      }
      
      override public function dispose() : void
      {
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_60)
         {
            this.var_60.release(new IIDHabboLocalizationManager());
            this.var_60 = null;
         }
         if(this.var_154)
         {
            this.var_154.release(new IIDHabboConfigurationManager());
            this.var_154 = null;
         }
         if(this._soundManager)
         {
            this._soundManager.release(new IIDHabboSoundManager());
            this._soundManager = null;
         }
         if(this._catalog)
         {
            this._catalog.release(new IIDHabboCatalog());
            this._catalog = null;
         }
         if(this._inventory)
         {
            this._inventory.release(new IIDHabboInventory());
            this._inventory = null;
         }
         if(this._navigator)
         {
            this._navigator.release(new IIDHabboNavigator());
            this._navigator = null;
         }
         if(this._questEngine)
         {
            this._questEngine.release(new IIDHabboQuestEngine());
            this._questEngine = null;
         }
         super.dispose();
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onLocalizationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_60 = param2 as IHabboLocalizationManager;
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_154 = param2 as IHabboConfigurationManager;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._catalog = param2 as IHabboCatalog;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._inventory = param2 as IHabboInventory;
      }
      
      private function onSoundManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._soundManager = param2 as IHabboSoundManager;
      }
      
      private function onNavigatorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._navigator = param2 as IHabboNavigator;
      }
      
      private function onQuestEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this._questEngine = param2 as IHabboQuestEngine;
      }
      
      public function createWidget(param1:String) : IRoomWidget
      {
         var _loc2_:* = null;
         if(this._windowManager == null)
         {
            return null;
         }
         switch(param1)
         {
            case RoomWidgetEnum.const_387:
               _loc2_ = new RoomChatWidget(this._windowManager,assets,this.var_60,this.var_154,this.var_2202++,this,this._questEngine);
               break;
            case RoomWidgetEnum.CHAT_INPUT_WIDGET:
               if(this.var_154.getKey("new.chat.widget.enabled") == "1")
               {
                  _loc2_ = new RoomChatInputWidget(this._windowManager,assets,this.var_60,this.var_154,this);
               }
               else
               {
                  _loc2_ = new RoomChatInputWidgetOld(this._windowManager,assets,this.var_60,this.var_154,this);
               }
               break;
            case RoomWidgetEnum.const_576:
               _loc2_ = new InfostandWidget(this._windowManager,assets,this.var_60,this.var_154,this._catalog);
               break;
            case RoomWidgetEnum.const_504:
               _loc2_ = new MeMenuWidget(this._windowManager,assets,this.var_60,events,this.var_154);
               break;
            case RoomWidgetEnum.const_782:
               _loc2_ = new PlaceholderWidget(this._windowManager,assets,this.var_60);
               break;
            case RoomWidgetEnum.const_520:
               _loc2_ = new CreditFurniWidget(this._windowManager,assets,this.var_60);
               break;
            case RoomWidgetEnum.const_599:
               _loc2_ = new StickieFurniWidget(this._windowManager,assets);
               break;
            case RoomWidgetEnum.const_557:
               _loc2_ = new PresentFurniWidget(this._windowManager,assets);
               break;
            case RoomWidgetEnum.const_503:
               _loc2_ = new TrophyFurniWidget(this._windowManager,assets);
               break;
            case RoomWidgetEnum.const_612:
               _loc2_ = new TeaserFurniWidget(this._windowManager,assets,this.var_60,this.var_154,this._inventory);
               break;
            case RoomWidgetEnum.const_507:
               _loc2_ = new EcotronBoxFurniWidget(this._windowManager,assets);
               break;
            case RoomWidgetEnum.const_456:
               _loc2_ = new PetPackageFurniWidget(this._windowManager,assets,this.var_60);
               break;
            case RoomWidgetEnum.const_124:
               _loc2_ = new DoorbellWidget(this._windowManager,assets,this.var_60);
               break;
            case RoomWidgetEnum.const_496:
               _loc2_ = new LoadingBarWidget(this._windowManager,assets,this.var_60,this.var_154);
               break;
            case RoomWidgetEnum.const_891:
               _loc2_ = new RoomQueueWidget(this._windowManager,assets,this.var_60,this.var_154);
               break;
            case RoomWidgetEnum.const_122:
               _loc2_ = new VoteWidget(this._windowManager,assets,this.var_60,this.var_154);
               break;
            case RoomWidgetEnum.const_414:
               _loc2_ = new PollWidget(this._windowManager,assets,this.var_60);
               break;
            case RoomWidgetEnum.const_334:
               _loc2_ = new UserChooserWidget(this._windowManager,assets,this.var_60);
               break;
            case RoomWidgetEnum.const_627:
               _loc2_ = new FurniChooserWidget(this._windowManager,assets,this.var_60);
               break;
            case RoomWidgetEnum.const_514:
               _loc2_ = new DimmerFurniWidget(this._windowManager,assets,this.var_60);
               break;
            case RoomWidgetEnum.const_143:
               _loc2_ = new FriendRequestWidget(this._windowManager,assets,this.var_60,this);
               break;
            case RoomWidgetEnum.const_535:
               _loc2_ = new ClothingChangeFurnitureWidget(this._windowManager,assets,this.var_60);
               break;
            case RoomWidgetEnum.const_890:
               _loc2_ = new RoomWidgetBase(this._windowManager);
               break;
            case RoomWidgetEnum.const_131:
               _loc2_ = new UserNotificationWidget(this._windowManager,assets,this.var_60);
               break;
            case RoomWidgetEnum.const_428:
               _loc2_ = new PurseWidget(this._windowManager,assets,this.var_60);
               break;
            case RoomWidgetEnum.const_128:
               _loc2_ = new AvatarInfoWidget(this._windowManager,assets,this.var_154,this.var_60,this);
               break;
            case RoomWidgetEnum.const_505:
               _loc2_ = new WelcomeGiftWidget(this._windowManager,assets,this.var_60);
               break;
            case RoomWidgetEnum.const_515:
               _loc2_ = new PlayListEditorWidget(this._windowManager,this._soundManager,assets,this.var_60,this.var_154,this._catalog);
               break;
            case RoomWidgetEnum.const_531:
               _loc2_ = new RoomInfoWidget(this);
         }
         return _loc2_;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get localizations() : IHabboLocalizationManager
      {
         return this.var_60;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this.var_154;
      }
      
      public function get navigator() : IHabboNavigator
      {
         return this._navigator;
      }
   }
}
